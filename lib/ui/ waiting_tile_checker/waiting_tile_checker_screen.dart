import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mahjong_assistant_a/ui/%20waiting_tile_checker/waiting_tile_checker_body.dart';
import 'package:mahjong_assistant_a/ui/%20waiting_tile_checker/waiting_tile_checker_view_model.dart';

class WaitingTileCheckerScreen extends ConsumerWidget {
  const WaitingTileCheckerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(waitingTileCheckerViewModelProvider);
    final viewModel = ref.watch(waitingTileCheckerViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('麻雀アシスタント'),
      ),
      body: WaitingTileCheckerBody(state, viewModel),
    );
  }
}
