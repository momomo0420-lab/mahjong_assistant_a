import 'package:image_picker/image_picker.dart';

abstract class CameraApi {
  Future<XFile?> takePicture();
}