import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/failure/error_handler.dart';
import '../../data/model/profile_model.dart';

abstract class IProfileRepository {
  Future<Either<AppErrorHandler, ProfileModel>> fetchProfileDetail();
  Future<Either<AppErrorHandler, dynamic>> updateProfile({
    String? name,
    String? email,
    File? image,
  });
  Future<Either<AppErrorHandler, dynamic>> postChildren({
    required String name,
    required String dateOfBirth,
    required String sex,
    required double height,
    required double weight,
  });
}
