import 'package:flutter/material.dart';
import 'package:mahjong_assistant_a/ui/%20waiting_tile_checker/waiting_tile_checker_state.dart';
import 'package:mahjong_assistant_a/ui/%20waiting_tile_checker/waiting_tile_checker_view_model.dart';

class WaitingTileCheckerBody extends StatelessWidget {
  final WaitingTileCheckerState _state;
  final WaitingTileCheckerViewModel _viewModel;

  const WaitingTileCheckerBody(
    WaitingTileCheckerState state,
    WaitingTileCheckerViewModel viewModel, {
    super.key,
  }): _state = state,
        _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text('成功'),
      ),
    );
  }
}
