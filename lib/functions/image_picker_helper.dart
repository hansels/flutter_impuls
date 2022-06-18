import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static ImagePicker imagePicker = ImagePicker();

  static Future<XFile> openCameraWithoutCrop() async {
    return await imagePicker.pickImage(source: ImageSource.camera);
  }

  static Future<XFile> openGalleryWithoutCrop() async {
    return await imagePicker.pickImage(source: ImageSource.gallery);
  }
}
