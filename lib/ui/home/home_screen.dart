import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mahjong_assistant_a/ui/home/home_body.dart';
import 'package:mahjong_assistant_a/ui/home/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  final Function()? _navigateNextScreen;

  const HomeScreen({
    super.key,
    Function()? navigateNextScreen,
  }): _navigateNextScreen = navigateNextScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final viewModel = ref.watch(homeViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('麻雀アシスタント'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HomeBody(
          state,
          viewModel,
          navigateNextScreen: _navigateNextScreen,
        ),
      ),
    );
  }
}
