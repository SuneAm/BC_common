import 'package:cloud_functions/cloud_functions.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final HttpLink httpLink = HttpLink(
    'https://graphql.ordrestyring.dk/graphql',
    defaultHeaders: {
      'Authorization': 'Bearer GdCt6bBGO23GZKsp',
    },
  );

  return GraphQLClient(link: httpLink, cache: GraphQLCache());
});

final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final functionsProvider = Provider<FirebaseFunctions>(
  (ref) => FirebaseFunctions.instance,
);

final sharedPrefProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final lightThemeProvider = StateProvider<bool>((ref) => true);
