import 'package:fpdart/fpdart.dart';
import '../../../../core/failure/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth_repository.dart';

class RegisterUsecase extends UseCase<dynamic, RegisterParams> {
  final IAuthRepository repository;

  RegisterUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, dynamic>> call(RegisterParams params) async {
    return await repository.registerUser(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;

  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterParams.fromMap(Map<String, dynamic> map) {
    return RegisterParams(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
