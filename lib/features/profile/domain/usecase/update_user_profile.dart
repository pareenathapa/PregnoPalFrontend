import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/failure/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class UpdateUserProfile extends UseCase<dynamic, UpdateUserProfileParams> {
  final IProfileRepository repository;

  UpdateUserProfile(this.repository);

  @override
  Future<Either<AppErrorHandler, dynamic>> call(
    UpdateUserProfileParams params,
  ) {
    return repository.updateProfile(
      name: params.name,
      email: params.email,
      image: params.image,
    );
  }
}

class UpdateUserProfileParams {
  final String? name;
  final String? email;
  final File? image;

  UpdateUserProfileParams({
    this.name,
    this.email,
    this.image,
  });
}
