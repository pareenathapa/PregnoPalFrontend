import 'dart:async';

import 'package:fpdart/src/either.dart';

import '../../../../core/failure/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/model/profile_model.dart';
import '../repository/profile_repository.dart';

class GetProfileDetailUseCase extends UseCase<ProfileModel, void> {
  final IProfileRepository _repository;

  GetProfileDetailUseCase({
    required IProfileRepository repository,
  }) : _repository = repository;

  @override
  FutureOr<Either<AppErrorHandler, ProfileModel>> call(void params) {
    return _repository.fetchProfileDetail();
  }
}
