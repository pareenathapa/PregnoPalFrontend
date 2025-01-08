import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';

import '../../generated/locale_keys.g.dart';

List<String> allowedDoc = ["mp4", "png", "jpg", "jpeg", "pdf", "doc", "docx"];

class FilePickerHelper {
  Future<Either<String?, File?>> pickSingleFile({
    FileType? type,
    List<String>? allowedExtensions,
  }) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type ??
            (allowedExtensions == null || allowedExtensions.isEmpty
                ? FileType.any
                : FileType.custom),
        allowedExtensions: allowedExtensions,
      );

      if (result != null) {
        return Right(File(result.files.single.path!));
      } else {
        return const Left(null);
      }
    } catch (error) {
      return const Left(
        LocaleKeys.commonErrors_filePick,
      );
    }
  }

  Future<Either<String?, List<File>>> pickMultipleFiles({
    FileType? type,
    List<String>? allowedExtensions,
    int? limit,
  }) async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: type ??
            (allowedExtensions == null || allowedExtensions.isEmpty
                ? FileType.any
                : FileType.custom),
        allowedExtensions: allowedExtensions,
        allowMultiple: true,
      );

      if (result != null) {
        return Right(result.files.map((e) => File(e.path!)).toList());
      } else {
        return const Left(null);
      }
    } catch (error) {
      return const Left(
        LocaleKeys.commonErrors_filePick,
      );
    }
  }
}
