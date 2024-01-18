import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mahjong_assistant_a/ui/home/home_state.dart';
import 'package:mahjong_assistant_a/ui/home/home_view_model.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeBody extends StatelessWidget {
  final AsyncValue<HomeState> _state;
  final HomeViewModel _viewModel;
  final Function()? _navigateNextScreen;

  const HomeBody(
    AsyncValue<HomeState> state,
    HomeViewModel viewModel, {
    super.key,
    Function()? navigateNextScreen,
  }): _state = state,
        _viewModel = viewModel,
        _navigateNextScreen = navigateNextScreen;

  @override
  Widget build(BuildContext context) {
    return _state.when(
      data: _onData,
      error: _onError,
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _onError(Object error, StackTrace stackTrace) {
    return const Placeholder();
  }

  Widget _onData(HomeState state) {
    Widget widget;

    if(state.cameraPermissionStatus.isGranted) {
      widget = _buildSelectFeatureBody(state);
    } else {
      widget = _buildRequestPermissionBody(state);
    }

    return widget;
  }

  Widget _buildSelectFeatureBody(HomeState state) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if(_navigateNextScreen != null) _navigateNextScreen!();
        },
        child: const Text('成功'),
      ),
    );
  }

  Widget _buildRequestPermissionBody(HomeState state) {
    return Column(
      children: [
        const Text('本アプリを使用するためにはカメラの権限が必要です。'),
        const Text('以下のボタン押下し、カメラの権限を許可してください。'),
        const SizedBox(height: 10,),

        ElevatedButton(
          onPressed: () => _viewModel.requestCameraPermission(),
          child: const Text('権限の設定'),
        ),
      ],
    );
  }
}
