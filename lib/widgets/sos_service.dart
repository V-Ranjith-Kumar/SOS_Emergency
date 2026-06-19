import 'dart:io';
import 'package:image_picker/image_picker.dart';

class SosService {
  static Future<File?> capturePhoto() async {
    final picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image == null) return null;

    return File(image.path);
  }
}
