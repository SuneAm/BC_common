import 'package:flutter/material.dart';
import 'package:ordrestyring_common/src/common_widgets/containers/app_container.dart';
import 'package:ordrestyring_common/src/common_widgets/text/caption_text.dart';
import 'package:ordrestyring_common/src/common_widgets/text/title_text.dart';
import 'package:ordrestyring_common/src/domain/users/user_info.dart';
import 'package:ordrestyring_common/src/utils/constants.dart';

class DateSelectionContainer extends StatelessWidget {
  const DateSelectionContainer({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.formatDate,
    this.onDateSelect,
    this.onDateClear,
    this.users = const [],
    this.onPeopleSelect,
  });

  final String title;
  final Color backgroundColor;
  final String? formatDate;
  final VoidCallback? onDateSelect;
  final VoidCallback? onDateClear;
  final List<UserInfo> users;
  final VoidCallback? onPeopleSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AppContainer(
        borderRadius: Constant.kNoBorderRadius,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(title),
              Row(
                children: [
                  const Expanded(child: Text('Dato:')),
                  Expanded(
                    flex: 2,
                    child: AppContainer(
                      onTap: onDateSelect,
                      borderRadius: Constant.kNoBorderRadius,
                      border: Border.all(),
                      padding: const EdgeInsets.all(4),
                      child: formatDate == null
                          ? const CaptionText('Vælg datoer')
                          : Text(formatDate ?? ''),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkResponse(
                    onTap: onDateClear,
                    child: const Icon(Icons.cancel),
                  ),
                ],
              ),
              if (onPeopleSelect != null) ...[
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(child: Text('Personer:')),
                    Expanded(
                      flex: 2,
                      child: AppContainer(
                        borderRadius: Constant.kNoBorderRadius,
                        border: Border.all(),
                        padding: const EdgeInsets.all(4),
                        child: users.isEmpty
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(),
                              )
                            : Wrap(
                                runSpacing: 8,
                                spacing: 8,
                                children: users
                                    .map(
                                      (user) => CircleAvatar(
                                        radius: 12,
                                        backgroundColor: backgroundColor,
                                        child: FittedBox(
                                            child: CaptionText(user.initials)),
                                      ),
                                    )
                                    .toList(),
                              ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkResponse(
                      onTap: onPeopleSelect,
                      child: const Icon(Icons.people),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
