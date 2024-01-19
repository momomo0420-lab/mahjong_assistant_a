import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:mahjong_assistant_a/data/data_source/gemini_api.dart';

class GeminiApiImpl implements GeminiApi {
  final Gemini _gemini;

  const GeminiApiImpl(
    Gemini gemini,
  ): _gemini = gemini;

  @override
  Stream<String> checkWaitingTile(Uint8List picture) async* {
    debugPrint('checkWaitingTile(gemini): start');

    final context = _gemini.streamGenerateContent(
      _createPrompt(),
      images: [
        picture,
      ]
    );

    await for(var value in context) {
      final response = (value.output == null)? '' : value.output!;
      yield response;
    }
    debugPrint('checkWaitingTile(gemini): end');
  }

  String _createPrompt() {
    return '次の画像は何でしょう？';
  }
}