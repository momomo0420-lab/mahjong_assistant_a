import 'dart:io';
import 'package:mahjong_assistant_a/data/data_source/camera_api.dart';
import 'package:mahjong_assistant_a/data/repository/camera_repository.dart';

class CameraRepositoryImpl implements CameraRepository {
  final CameraApi _api;

  const CameraRepositoryImpl(
    CameraApi api
  ): _api = api;

  @override
  Future<File?> takePicture() async {
    final picture = await _api.takePicture();
    return (picture == null) ? null : File(picture.path);
  }
}