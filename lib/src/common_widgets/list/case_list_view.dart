import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'scroll_with_bar.dart';

class CasesListView extends HookConsumerWidget {
  const CasesListView({
    super.key,
    required this.length,
    required this.itemBuilder,
  });

  final int length;
  final NullableIndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    return ScrollWithBar(
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(12),
        itemCount: length,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
