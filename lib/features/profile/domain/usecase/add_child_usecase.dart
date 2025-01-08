import 'package:fpdart/fpdart.dart';

import '../../../../core/failure/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/profile_repository.dart';

class AddChildUsecase extends UseCase<dynamic, AddChildParams> {
  final IProfileRepository repository;

  AddChildUsecase(this.repository);

  @override
  Future<Either<AppErrorHandler, dynamic>> call(AddChildParams params) {
    return repository.postChildren(
      name: params.name,
      dateOfBirth: params.dateOfBirth,
      height: params.height,
      sex: params.sex,
      weight: params.weight,
    );
  }
}

class AddChildParams {
  final String name;
  final String dateOfBirth;
  final String sex;
  final double height;
  final double weight;

  AddChildParams({
    required this.name,
    required this.dateOfBirth,
    required this.sex,
    required this.height,
    required this.weight,
  });
}
