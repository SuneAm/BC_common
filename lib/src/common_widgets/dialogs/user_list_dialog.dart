import 'package:flutter/material.dart';
import 'package:ordrestyring_common/ordrestyring_common.dart';

class UserListDialog extends HookConsumerWidget {
  const UserListDialog({
    required this.onSubmit,
    required this.selectedUsers,
    this.isMultiple = true,
    super.key,
  });

  final Function(List<UserInfo> selectedUsers) onSubmit;
  final List<UserInfo> selectedUsers;
  final bool isMultiple;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUsers = ref.watch(usersProvider);
    final persons = useState<List<UserInfo>>(selectedUsers);

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
                      onSubmit(persons.value);
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
                      onChanged: (newValue) {
                        if (isMultiple) {
                          persons.value = newValue!
                              ? [...persons.value, u.toUserInfo]
                              : persons.value
                                  .where((e) => e.id != u.id)
                                  .toList();
                        } else {
                          persons.value = [u.toUserInfo];
                        }
                      },
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
