import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonAsyncWidget<T> extends ConsumerWidget {
  const CommonAsyncWidget({
    super.key,
    required this.asyncValue,
    required this.data,
    this.error,
    this.loading,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace stackTrace)? error;
  final Widget Function()? loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncValue.when(
      data: data,
      error: error ??
          (error, stackTrace) {
            debugPrint('error: ${error.toString()}');

            return const SizedBox();
          },
      loading:
          loading ?? () => const Center(child: CircularProgressIndicator()),
    );
  }
}
