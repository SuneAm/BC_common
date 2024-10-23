import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ordrestyring_common/src/domain/holiday.dart';
import 'package:ordrestyring_common/src/providers.dart';

final holidayRepoProvider = Provider<HolidayRepository>((ref) {
  return HolidayRepository(ref);
});

class HolidayRepository {
  HolidayRepository(this._ref);

  final Ref _ref;

  FirebaseFirestore get _firestore => _ref.read(firestoreProvider);

  static const _collectionName = 'holidays';

  Future<void> createHoliday(Holiday holiday) async {
    final docRef = _firestore.collection(_collectionName).doc();
    return docRef.set(holiday.toFirestore());
  }

  Future<void> deleteHoliday(String id) async {
    final docRef = _firestore.collection(_collectionName).doc(id);
    return await docRef.delete();
  }

  Future<List<Holiday>> getHolidays() async {
    final snapshot =
        await _firestore.collection(_collectionName).orderBy('createdAt').get();

    return snapshot.docs.map((snap) => Holiday.fromFirestore(snap)).toList();
  }
}
