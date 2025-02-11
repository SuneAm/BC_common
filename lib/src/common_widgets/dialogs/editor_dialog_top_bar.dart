import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ordrestyring_common/src/utils/asset_utils.dart';
import 'package:ordrestyring_common/src/providers.dart';

class EditorDialogTopBar extends StatelessWidget {
  const EditorDialogTopBar({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        child: EditorBackgroundImage(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class EditorBackgroundImage extends ConsumerWidget {
  const EditorBackgroundImage({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(lightThemeProvider);

    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            isLightTheme
                ? AssetUtils.appbarBackgroundLight
                : AssetUtils.appbarBackgroundDark,
          ),
        ),
      ),
      child: child,
    );
  }
}
