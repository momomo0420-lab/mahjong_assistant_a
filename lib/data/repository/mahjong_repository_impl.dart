import 'dart:io';
import 'package:mahjong_assistant_a/data/data_source/gemini_api.dart';
import 'package:mahjong_assistant_a/data/repository/mahjong_repository.dart';

class MahjongRepositoryImpl implements MahjongRepository {
  final GeminiApi _api;

  const MahjongRepositoryImpl(
    GeminiApi api,
  ): _api = api;

  @override
  Stream<String> checkWaitingTile(File picture) {
    final bytePicture = picture.readAsBytesSync();
    return _api.checkWaitingTile(bytePicture);
  }
}