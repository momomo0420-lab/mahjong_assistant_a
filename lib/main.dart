import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mahjong_assistant_a/app_navigator.dart';
import 'package:mahjong_assistant_a/env/env.dart';

late List<CameraDescription> cameraDescriptions;

void main() {
  Gemini.init(apiKey: Env.geminiApiKey);

  runApp(
    const ProviderScope(
      child: AppNavigator(),
    ),
  );
}
