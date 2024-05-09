import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ordrestyring_common/src/domain/users/user.dart';
import 'package:ordrestyring_common/src/providers.dart';

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref);
});

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
    } catch (_) {
      rethrow;
    }
  }

  Stream<List<User>> watchUsers() {
    final snapshots = _firestore
        .collection('users')
        .orderBy('id', descending: true)
        .snapshots();

    return snapshots.map((snapshot) => snapshot.docs
        .map((document) => User.fromJson(document.data()))
        .toList());
  }
}
