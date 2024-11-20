import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/gestures.dart';

class ShiftScrollListener extends HookConsumerWidget {
  const ShiftScrollListener({
    super.key,
    required this.child,
    required this.onKeyEvent,
    required this.onPointerSignal,
  });

  final Widget child;
  final ValueChanged<KeyEvent>? onKeyEvent;
  final void Function(PointerSignalEvent event)? onPointerSignal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    return KeyboardListener(
      autofocus: true,
      focusNode: focusNode,
      onKeyEvent: onKeyEvent,
      child: Listener(
        onPointerSignal: onPointerSignal,
        child: child,
      ),
    );
  }
}
