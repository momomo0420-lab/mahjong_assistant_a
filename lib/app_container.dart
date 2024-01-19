import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahjong_assistant_a/data/data_source/camera_api.dart';
import 'package:mahjong_assistant_a/data/data_source/camera_api_impl.dart';
import 'package:mahjong_assistant_a/data/data_source/gemini_api.dart';
import 'package:mahjong_assistant_a/data/data_source/gemini_api_impl.dart';
import 'package:mahjong_assistant_a/data/repository/camera_repository_impl.dart';
import 'package:mahjong_assistant_a/data/repository/mahjong_repository.dart';
import 'package:mahjong_assistant_a/data/repository/mahjong_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/repository/camera_repository.dart';

part 'app_container.g.dart';

@riverpod
GeminiApi geminiApi(GeminiApiRef ref) {
  final gemini = Gemini.instance;
  return GeminiApiImpl(gemini);
}

@riverpod
MahjongRepository mahjongRepository(MahjongRepositoryRef ref) {
  final api = ref.watch(geminiApiProvider);
  return MahjongRepositoryImpl(api);
}

@riverpod
CameraApi cameraApi(CameraApiRef ref) {
  final picker = ImagePicker();
  return CameraApiImpl(picker);
}

@riverpod
CameraRepository cameraRepository(CameraRepositoryRef ref) {
  final api = ref.watch(cameraApiProvider);
  return CameraRepositoryImpl(api);
}