import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'waiting_tile_checker_state.freezed.dart';

@freezed
class WaitingTileCheckerState with _$WaitingTileCheckerState {
  const factory WaitingTileCheckerState({
    @Default(null)
    int? id,
    @Default(null)
    File? picture,
    @Default('')
    String response,
    @Default(false)
    bool isLoading,
  }) = _WaitingTileCheckerState;
}
