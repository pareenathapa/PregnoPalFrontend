import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../failure/error_handler.dart';

class FileUploadHelper {
  FutureOr<Either<AppErrorHandler, bool>> sendFileToPresignedUrl({
    required String presignedUrl,
    required File file,
  }) async {
    log('_sendFileToPresignedUrl: $presignedUrl');
    log('_sendFileToPresignedUrl: $file');

    final Uri uri = Uri.parse(presignedUrl);
    final fileBlob = await file.readAsBytes();

    // Extract headers based on file extension
    final Map<String, String> headers = {
      'Content-Type': file.path.split('.').last,
    };

    try {
      final dioInstance = Dio();
      dioInstance.options.headers = headers;
      final presignedURLResponse = await dioInstance.put(
        uri.toString(),
        data: fileBlob,
      );

      log('_sendFileToPresignedUrl: $presignedURLResponse');

      if (presignedURLResponse.statusCode == 200) {
        return const Right(true); // File uploaded successfully
      } else {
        return Left(
          AppErrorHandler(
            message: presignedURLResponse.statusMessage.toString(),
          ),
        );
      }
    } catch (e) {
      return Left(
        AppErrorHandler(message: 'Failed to upload file: ${e.toString()}'),
      );
    }
  }
}
