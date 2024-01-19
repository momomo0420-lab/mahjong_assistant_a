import 'package:image_picker/image_picker.dart';
import 'package:mahjong_assistant_a/data/data_source/camera_api.dart';

class CameraApiImpl implements CameraApi {
  final ImagePicker _picker;

  const CameraApiImpl(
    ImagePicker picker,
  ): _picker = picker;

  @override
  Future<XFile?> takePicture() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }
}