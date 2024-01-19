import 'dart:typed_data';

abstract class GeminiApi {
  Stream<String> checkWaitingTile(Uint8List picture);
}