import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ordrestyring_common/src/domain/case/case.dart';
import 'package:ordrestyring_common/src/domain/case/hour_aggregate.dart';
import 'package:ordrestyring_common/src/providers.dart';

final caseRepoProvider = Provider<CaseRepository>((ref) {
  return CaseRepository(ref);
});

class CaseRepository {
  CaseRepository(this._ref);

  final Ref _ref;

  FirebaseFirestore get _firestore => _ref.read(firestoreProvider);

  /*Future<void> fetchAndUpdateCases() async {
    final QueryResult result = await _client.query(QueryOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: gql('''
        {
          cases(
            pagination: {cursor: null, limit: 12}
            orderBy: {field: "caseNumber", direction: DESC}
            filters: {statuses: 99991, types:999996}
          ) {
            items {
              caseNumber
              economy {
                hoursCostprice
                hoursSalesprice
                offer
                billableHoursCount
                materialsCostprice
              }
              projectName
              responsibleUser {
                fullName
              }
              caseType {
                text
              }
              status {
                text
              }
            }
          }
        }
      '''),
    ));

    if (result.hasException) {
      debugPrint('data has exception');
      throw result.exception!;
    }

    final cases = result.data?['cases']['items'].map<Case>((item) => Case.fromJson(item)).toList();

    await updateCaseCollection(cases);
  }*/

/*  Future<HourAggregate> fetchCaseHours(int caseId) async {
    final QueryResult result = await _client.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        variables: {'caseId': caseId},
        document: gql('''
        query (\$caseId: Int!) {
                hourAggregate(caseId: \$caseId) {
                    totalCostPrice
                    totalHours
                    hourTypes {
                        name
                        totalCostPrice
                        totalHours
                    }
                }
            }
      '''),
      ),
    );

    if (result.hasException) {
      debugPrint('data has exception');
      throw result.exception!;
    }

    return HourAggregate.fromMap(result.data?['hourAggregate']);
  }*/

  Future<void> fetchAndUpdateCases() async {
    final response = await http.get(Uri.parse(
        'https://europe-west3-bc-ordrestyrring.cloudfunctions.net/fetchCases'));
    // https://europe-west3-bc-ordrestyrring.cloudfunctions.net/fetchCases
    if (response.statusCode != 200) return;

    final result = jsonDecode(response.body) as Map<String, dynamic>?;

    final cases = result?['data']['cases']['items']
            .map<Case>((item) => Case.fromJson(item))
            .toList() as List<Case>? ??
        [];

    if (cases.isNotEmpty) {
      // fetch case aggregate hours
      final casesWithHours = <Case>[];

      for (final element in cases) {
        final aggregateHour = await fetchCaseHours(element.id);

        casesWithHours.add(element.copyWith(hourAggregate: aggregateHour));
      }
      await updateCaseCollection(casesWithHours);
    }
  }

  Future<HourAggregate> fetchCaseHours(int caseId) async {
    final response = await http.post(
      Uri.parse(
          'https://europe-west3-bc-ordrestyrring.cloudfunctions.net/fetchCaseHours'),
      body: {'caseId': '$caseId'},
    );
    if (response.statusCode != 200) throw 'Some error occurred';

    final result = jsonDecode(response.body) as Map<String, dynamic>?;

    return HourAggregate.fromMap(result?['data']['hourAggregate']);
  }

  Stream<List<Case>> watchCases() {
    final snapshots = _firestore
        .collection('cases')
        .orderBy('caseNumber', descending: true)
        .snapshots();

    return snapshots.map((snapshot) => snapshot.docs
        .map((document) => Case.fromFirestore(document.data()))
        .toList());
  }

  Stream<List<Case>> watchProduktionCases() {
    final snapshots = _firestore
        .collection('cases')
        .where('isProduktion', isEqualTo: true)
        .orderBy('caseNumber', descending: true)
        .snapshots();

    return snapshots.map((snapshot) => snapshot.docs
        .map((document) => Case.fromFirestore(document.data()))
        .toList());
  }

  Stream<List<Case>> watchMontageCases() {
    final snapshots = _firestore
        .collection('cases')
        .where('isMontage', isEqualTo: true)
        .orderBy('caseNumber', descending: true)
        .snapshots();

    return snapshots.map((snapshot) => snapshot.docs
        .map((document) => Case.fromFirestore(document.data()))
        .toList());
  }

  Future<void> updateCaseCollection(List<Case> updatedCases) async {
    final collection = _firestore.collection('cases');

    // Fetch current documents
    final currentSnapshot = await collection.get();
    List<DocumentSnapshot> currentDocuments = currentSnapshot.docs;

    // Create a map of current documents for easy lookup
    Map<String, DocumentSnapshot> currentDocumentMap = {
      for (var doc in currentDocuments) doc.id: doc
    };

    // Start a batch write
    final batch = _firestore.batch();

    // Process updates
    for (var newDoc in updatedCases) {
      final docId =
          newDoc.caseNumber; // Assuming each document has an caseNumber

      // Update or add new documents
      batch.set(
          collection.doc(docId), newDoc.toFirestore(), SetOptions(merge: true));

      // Remove from the map to keep track of what's been processed
      currentDocumentMap.remove(docId);
    }

    // Delete documents that are no longer present
    for (var remainingDocId in currentDocumentMap.keys) {
      batch.delete(collection.doc(remainingDocId));
    }

    // Commit the batch
    await batch.commit();
  }

  // updating case
  void updateCase(Case caseItem, {bool merge = true}) async {
    final casesRef = _firestore.collection('cases').doc(caseItem.caseNumber);
    await casesRef.set(
      caseItem.toFirestore(),
      SetOptions(merge: merge),
    );
  }
}

final watchProduktionCases = StreamProvider<List<Case>>(
        (ref) => ref.watch(caseRepoProvider).watchProduktionCases());

final watchMontageCases = StreamProvider<List<Case>>(
        (ref) => ref.watch(caseRepoProvider).watchMontageCases());