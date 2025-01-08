import 'package:fpdart/fpdart.dart';
import '../../../../core/failure/error_handler.dart';
import '../../data/models/user_model.dart';

abstract class IAuthRepository {
  Future<Either<AppErrorHandler, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<AppErrorHandler, UserModel>> loginUser({
    required String email,
    required String password,
  });
}
