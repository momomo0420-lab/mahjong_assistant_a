import 'package:freezed_annotation/freezed_annotation.dart';

part 'waiting_tile_checker_state.freezed.dart';

@freezed
class WaitingTileCheckerState with _$WaitingTileCheckerState {
  const factory WaitingTileCheckerState({
    @Default(null)
    int? id,
  }) = _WaitingTileCheckerState;
}
