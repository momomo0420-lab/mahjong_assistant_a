
import 'package:mahjong_assistant_a/app_container.dart';
import 'package:mahjong_assistant_a/ui/waiting_tile_checker/waiting_tile_checker_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'waiting_tile_checker_view_model.g.dart';

@riverpod
class WaitingTileCheckerViewModel extends _$WaitingTileCheckerViewModel {
  @override
  FutureOr<WaitingTileCheckerState> build() async {
    final camera = ref.read(cameraRepositoryProvider);
    final picture = await camera.takePicture();

    return WaitingTileCheckerState(picture: picture);
  }
}
