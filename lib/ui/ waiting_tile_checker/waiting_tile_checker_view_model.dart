import 'package:camera/camera.dart';
import 'package:mahjong_assistant_a/ui/%20waiting_tile_checker/waiting_tile_checker_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'waiting_tile_checker_view_model.g.dart';

@riverpod
class WaitingTileCheckerViewModel extends _$WaitingTileCheckerViewModel {
  @override
  WaitingTileCheckerState build() {
    return const WaitingTileCheckerState();
  }

  Future<void> camera() async {
    final camera = await availableCameras();

  }
}
