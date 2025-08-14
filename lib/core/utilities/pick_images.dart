import 'dart:io';

import 'package:image_picker/image_picker.dart';

class FuctionsPickImage {
  static Future<File?> pickImageGallery() async {
    File? image;
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = File(file.path);
    }
    return image;
  }
}
