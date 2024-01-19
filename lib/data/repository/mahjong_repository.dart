import 'dart:io';

abstract class MahjongRepository {
  Stream<String> checkWaitingTile(File picture);
}