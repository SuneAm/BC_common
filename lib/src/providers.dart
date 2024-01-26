import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final HttpLink httpLink = HttpLink(
    'https://graphql.ordrestyring.dk/graphql',
    defaultHeaders: {
      'Authorization': 'Bearer GdCt6bBGO23GZKsp',
    },
  );

  return GraphQLClient(link: httpLink, cache: GraphQLCache());
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
