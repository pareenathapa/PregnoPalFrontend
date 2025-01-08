import 'dart:io';

import 'package:fpdart/src/either.dart';

import '../../../../core/failure/error_handler.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/remote/profile_remote_data_source.dart';
import '../model/profile_model.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppErrorHandler, ProfileModel>> fetchProfileDetail() {
    return remoteDataSource.fetchProfileDetail();
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> updateProfile({
    String? name,
    String? email,
    File? image,
  }) {
    return remoteDataSource.updateProfile(
      name: name,
      email: email,
      image: image,
    );
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> postChildren({
    required String name,
    required String dateOfBirth,
    required String sex,
    required double height,
    required double weight,
  }) {
    return remoteDataSource.postChildren(
      name: name,
      dateOfBirth: dateOfBirth,
      height: height,
      sex: sex,
      weight: weight,
    );
  }
}
