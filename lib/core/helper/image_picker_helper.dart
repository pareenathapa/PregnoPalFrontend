import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final picker = ImagePicker();
  Future<List<File>?> openMultipleImagePicker({int? limit}) async {
    try {
      final List<XFile> pickedImages =
          await picker.pickMultiImage(limit: limit);
      return pickedImages.map((e) => File(e.path)).toList();
    } on Exception {
      return [];
    }
  }

  Future<File?> openImagePicker(
    ImageSource source, {
    CameraDevice preferredCameraDevice = CameraDevice.rear,
  }) async {
    try {
      final XFile? pickedImage = await picker.pickImage(
        source: source,
        preferredCameraDevice: preferredCameraDevice,
      );
      if (pickedImage != null) {
        return File(pickedImage.path);
      }
    } on Exception {
      return null;
    }
    return null;
  }
}
