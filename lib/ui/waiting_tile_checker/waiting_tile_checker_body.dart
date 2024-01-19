import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mahjong_assistant_a/ui/waiting_tile_checker/waiting_tile_checker_state.dart';
import 'package:mahjong_assistant_a/ui/waiting_tile_checker/waiting_tile_checker_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class WaitingTileCheckerBody extends HookWidget {
  final AsyncValue<WaitingTileCheckerState> _state;
  final WaitingTileCheckerViewModel _viewModel;

  const WaitingTileCheckerBody(
      AsyncValue<WaitingTileCheckerState> state,
    WaitingTileCheckerViewModel viewModel, {
    super.key,
  }): _state = state,
        _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return _state.when(
      data: (data) => onData(data),
      error: (error, stackTrace) => const Center(child: Text('予期せぬエラーが発生しました。'),),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget onData(WaitingTileCheckerState state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.file(state.picture!),
          const SizedBox(height: 10,),

          Text(state.response),
          const SizedBox(height: 10,),

          if(state.isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
