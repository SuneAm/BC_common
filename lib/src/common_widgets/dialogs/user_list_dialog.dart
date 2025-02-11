import 'package:flutter/material.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';

class UserListDialog extends HookConsumerWidget {
  const UserListDialog({
    required this.onValueChange,
    required this.selectedUsers,
    super.key,
  });

  final Function(List<User> selectedUsers) onValueChange;
  final List<User> selectedUsers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUsers = ref.watch(usersProvider);
    final persons = useState<List<User>>(selectedUsers);

    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
          maxHeight: 600,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: TitleLarge(
                      'Medarbejdere',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      onValueChange(persons.value);
                      Navigator.pop(context);
                    },
                    child: const Text('Submit'),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: allUsers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final u = allUsers[index];
                    final isSelected = persons.value.any((e) => e.id == u.id);

                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isSelected,
                      title: Text(u.fullName),
                      onChanged: (newValue) => persons.value = newValue!
                          ? [...persons.value, u]
                          : persons.value.where((e) => e.id != u.id).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
