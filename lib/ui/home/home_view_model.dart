import 'package:mahjong_assistant_a/ui/home/home_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  FutureOr<HomeState> build() async {
    final status = await Permission.camera.status;

    return HomeState(
      cameraPermissionStatus: status,
    );
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    state = AsyncData(
      HomeState(cameraPermissionStatus: status),
    );
  }
}