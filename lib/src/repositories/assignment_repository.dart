import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ordrestyring_common/src/domain/assignment/assignment.dart';
import 'package:ordrestyring_common/src/providers.dart';

final assignmentRepoProvider = Provider<AssignmentRepository>((ref) {
  return AssignmentRepository(ref);
});

class AssignmentRepository {
  AssignmentRepository(this.ref);

  final Ref ref;

  FirebaseFirestore get _firestore => ref.read(firestoreProvider);

  static const _collectionName = 'assignments';

  Future<void> addNewAssignment(Assignment assignment) async =>
      await _firestore.collection(_collectionName).add(
            assignment.toFirestore(),
          );

  Stream<List<Assignment>> watchAssignments() {
    final snapshots = _firestore.collection(_collectionName).snapshots();

    return snapshots.map(
      (snap) => snap.docs.map((doc) => Assignment.fromFirestore(doc)).toList(),
    );
  }
}

final _watchAssignmentsProvider = StreamProvider<List<Assignment>>(
  (ref) => ref.watch(assignmentRepoProvider).watchAssignments(),
);

final assignmentsProvider = Provider<List<Assignment>>(
  (ref) => ref.watch(_watchAssignmentsProvider).maybeWhen(
        orElse: () => [],
        data: (assignments) => assignments,
      ),
);
