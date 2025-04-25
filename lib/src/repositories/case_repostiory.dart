import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ordrestyring_common/src/domain/case/case.dart';
import 'package:ordrestyring_common/src/providers.dart';

final caseRepoProvider = Provider<CaseRepository>((ref) {
  return CaseRepository(ref);
});

class CaseRepository {
  CaseRepository(this._ref);

  final Ref _ref;

  FirebaseFirestore get _firestore => _ref.read(firestoreProvider);

  Future<void> fetchCasesWithHours() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://europe-west3-bc-ordrestyrring.cloudfunctions.net/fetchCasesWithHours'),
      );
      log('Response status code: ${response.statusCode}');
    } catch (e) {
      log('Error fetching cases with hours: $e');
    }
  }

  Stream<List<Case>> watchCases() {
    try {
      final snapshots = _firestore
          .collection('cases')
          .where('status.text', isEqualTo: 'Åben')
          .orderBy('caseNumber')
          .snapshots();

      return snapshots.map((snapshot) => snapshot.docs
          .map((document) => Case.fromFirestore(document.data()))
          .toList());
    } catch (e) {
      log('Error fetching cases: $e');
      return Stream.value([]);
    }
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

  Stream<List<Case>> watchEconomyCases() {
    try {
      final snapshots = _firestore
          .collection('cases')
          .where(
            Filter.or(
              Filter('isProduktion', isEqualTo: true),
              Filter('status.text', isEqualTo: 'Lukket'),
            ),
          )
          .orderBy('caseNumber', descending: true)
          .snapshots();

      return snapshots.map((snapshot) => snapshot.docs
          .map((document) => Case.fromFirestore(document.data()))
          .toList());
    } catch (e) {
      log('Error fetching cases: $e');
      rethrow;
    }
  }

  Stream<List<Case>> watchMontageCases() {
    try {
      final snapshots = _firestore
          .collection('cases')
          .where('isMontage', isEqualTo: true)
          .orderBy('caseNumber', descending: true)
          .snapshots();

      return snapshots.map((snapshot) => snapshot.docs
          .map((document) => Case.fromFirestore(document.data()))
          .toList());
    } catch (e) {
      log('Error fetching cases: $e');
      return Stream.value([]);
    }
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
  Future<void> updateCase(Case caseItem, {bool merge = true}) async {
    final casesRef = _firestore.collection('cases').doc(caseItem.caseNumber);
    await casesRef.set(
      caseItem.toFirestore(),
      SetOptions(merge: merge),
    );
  }
}

final _watchCasesProvider = StreamProvider<List<Case>>(
  (ref) => ref.watch(caseRepoProvider).watchCases(),
);
final _watchProduktionCases = StreamProvider<List<Case>>(
  (ref) => ref.watch(caseRepoProvider).watchProduktionCases(),
);

final _watchMontageCases = StreamProvider<List<Case>>(
  (ref) => ref.watch(caseRepoProvider).watchMontageCases(),
);

final _watchEconomyCases = StreamProvider<List<Case>>(
  (ref) => ref.watch(caseRepoProvider).watchEconomyCases(),
);

final casesProvider = Provider<List<Case>>(
  (ref) => ref.watch(_watchCasesProvider).maybeWhen(
        orElse: () => [],
        data: (cases) => cases,
      ),
);

final productionCasesProvider = Provider<List<Case>>(
  (ref) => ref.watch(_watchProduktionCases).maybeWhen(
        orElse: () => [],
        data: (cases) => cases,
      ),
);

final economyCasesProvider = Provider<List<Case>>(
  (ref) => ref.watch(_watchEconomyCases).maybeWhen(
        orElse: () => [],
        data: (cases) => cases,
      ),
);

final montageCasesProvider = Provider<List<Case>>(
  (ref) => ref.watch(_watchMontageCases).maybeWhen(
        orElse: () => [],
        data: (cases) => cases,
      ),
);
