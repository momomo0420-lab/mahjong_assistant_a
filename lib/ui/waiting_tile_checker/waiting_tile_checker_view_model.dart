import 'package:mahjong_assistant_a/app_container.dart';
import 'package:mahjong_assistant_a/ui/waiting_tile_checker/waiting_tile_checker_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'waiting_tile_checker_view_model.g.dart';

@riverpod
class WaitingTileCheckerViewModel extends _$WaitingTileCheckerViewModel {
  @override
  FutureOr<WaitingTileCheckerState> build() async {
    // 写真の取得
    final camera = ref.read(cameraRepositoryProvider);
    final picture = await camera.takePicture();

    // 写真のデータを元にAIへの問いかけを行う
    final repository = ref.read(mahjongRepositoryProvider);
    final stream = repository.checkWaitingTile(picture!);
    stream.listen(
      (response) {
        final oldState = state.value!;
        final newState = oldState.copyWith(response: oldState.response + response);
        state = AsyncData(newState);
      },
      onDone: () {
        final oldState = state.value!;
        final newState = oldState.copyWith(isLoading: false);
        state = AsyncData(newState);
      }
    );

    return WaitingTileCheckerState(picture: picture, isLoading: true);
  }
}
