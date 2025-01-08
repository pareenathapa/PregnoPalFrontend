import 'package:fpdart/fpdart.dart';
import '../../../../core/failure/error_handler.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/user_model.dart';
import '../repository/auth_repository.dart';

class LoginUsecase extends UseCase<UserModel, LoginParams> {
  final IAuthRepository repository;

  LoginUsecase({required this.repository});

  @override
  Future<Either<AppErrorHandler, UserModel>> call(LoginParams params) async {
    return await repository.loginUser(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  @override
  String toString() {
    return 'LoginParams(email: $email, password: $password)';
  }
}
