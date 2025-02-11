import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ordrestyring_common/src/domain/vacation/vacation.dart';
import 'package:ordrestyring_common/src/providers.dart';

class VacationRepository {
  VacationRepository(this._ref);

  final Ref _ref;

  FirebaseFirestore get _firestore => _ref.read(firestoreProvider);

  static const _vacations = 'vacations';

  Future<void> createVacationRequest(Vacation vacation) async {
    final docRef = _firestore.collection(_vacations).doc();

    return docRef.set(vacation.toFirestore());
  }

  Stream<List<Vacation>> watchVacations() {
    final snapshots =
        _firestore.collection(_vacations).orderBy('createdAt').snapshots();

    return snapshots.map((snapshot) => snapshot.docs
        .map((document) => Vacation.fromFirestore(document))
        .toList());
  }

  Future<void> approvedRequest(String docId, String status) async {
    final docRef = _firestore.collection(_vacations).doc(docId);

    return docRef.set({'status': status}, SetOptions(merge: true));
  }

  Future<List<Vacation>> getUserVacations(int userId) async {
    final snapshot = await _firestore
        .collection(_vacations)
        .where('user.id', isEqualTo: userId)
        .orderBy('createdAt')
        .get();

    return snapshot.docs.map((snap) => Vacation.fromFirestore(snap)).toList();
  }

  Stream<List<Vacation>> getApprovedRequest() {
    final snapshot = _firestore
        .collection(_vacations)
        .where('status', isEqualTo: 'approved')
        .orderBy('createdAt')
        .snapshots();

    return snapshot.map((snaps) =>
        snaps.docs.map((snap) => Vacation.fromFirestore(snap)).toList());
  }

  Future<void> deleteRequest(String vacationId) async {
    final docRef = _firestore.collection(_vacations).doc(vacationId);

    return await docRef.delete();
  }

  Future<void> addVacations(List<Vacation> vacations) async {
    final batch = _firestore.batch();

    for (final vacation in vacations) {
      final docRef = _firestore.collection(_vacations).doc();
      batch.set(docRef, vacation.toFirestore());
    }

    return await batch.commit();
  }
}

final vacationRepoProvider = Provider<VacationRepository>((ref) {
  return VacationRepository(ref);
});

final _watchVacationsProvider = StreamProvider.autoDispose<List<Vacation>>(
  (ref) => ref.watch(vacationRepoProvider).watchVacations(),
);

final vacationsProvider = Provider.autoDispose<List<Vacation>>((ref) {
  final value = ref.watch(_watchVacationsProvider);

  // a timer to be used by the callbacks below
  Timer? timer;
  final link = ref.keepAlive();

  // triggered right before the provider is destroyed
  ref.onDispose(() {
    timer?.cancel();
  });

  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() {
    // start a 1 minute timer
    timer = Timer(
      const Duration(minutes: 1),
      () => link.close(), // dispose on timeout
    );
  });

  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() {
    timer?.cancel();
  });

  return value.value ?? [];
});
