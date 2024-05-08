import 'package:cloud_functions/cloud_functions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ordrestyring_common/src/providers.dart';
import 'package:http/http.dart' as http;

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref);
});

class UserRepository {
  UserRepository(this.ref);

  final Ref ref;

  FirebaseFunctions get _functions => ref.read(functionsProvider);

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
}
