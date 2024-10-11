import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ordrestyring_common/src/domain/users/user.dart';
import 'package:ordrestyring_common/src/providers.dart';

class UserRepository {
  UserRepository(this._ref);

  final Ref _ref;

  FirebaseFirestore get _firestore => _ref.read(firestoreProvider);

  // Future<void> fetchUsers() async {
  //   try {
  //     final callableFunction = _functions.httpsCallable('fetchUsers');
  //
  //     await callableFunction.call();
  //   } catch (_) {
  //     rethrow;
  //   }
  // }

  Future<void> fetchUsers() async {
    try {
      await http.get(Uri.parse(
          'https://europe-west3-bc-ordrestyrring.cloudfunctions.net/fetchUsers'));
    } catch (e) {
      debugPrint('error : $e');
      rethrow;
    }
  }

  Stream<List<User>> watchUsers() {
    final snapshots =
        _firestore.collection('users').orderBy('fullName').snapshots();

    return snapshots.map((snapshot) => snapshot.docs
        .map((document) => User.fromJson(document.data()))
        .toList());
  }
}

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref);
});

final _watchUsersProvider = StreamProvider.autoDispose<List<User>>(
  (ref) => ref.watch(userRepoProvider).watchUsers(),
);

final usersProvider = Provider.autoDispose<List<User>>((ref) {
  final value = ref.watch(_watchUsersProvider);

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
