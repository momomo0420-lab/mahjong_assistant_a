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
    return '''
      あなたはプロの雀士です。
      次の画像の手牌を確認し、何を切ればテンパイになるか教えてください。
      またそれの待ち牌が何かも教えてください。
      上記のパターンが複数ある場合、全部列挙してください。
      どれを切ってもテンパイにならない場合は「該当なしです」と答えてください。
    ''';
  }
}