import 'package:fpdart/fpdart.dart';

import '../../../../core/common/models/token_model.dart';
import '../../../../core/failure/error_handler.dart';
import '../../../../core/utils/token_storage.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/remote/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenStorage,
  });

  @override
  Future<Either<AppErrorHandler, UserModel>> loginUser({
    required String email,
    required String password,
  }) async {
    // return remoteDataSource.loginUser(email: email, password: password);
    final result = await remoteDataSource.loginUser(
      email: email,
      password: password,
    );
    return result.fold(
      (error) => Left(error),
      (data) async {
        await tokenStorage.setToken(
          TokenModel(
            accessToken: data.token,
          ),
        );
        return Right(data);
      },
    );
  }

  @override
  Future<Either<AppErrorHandler, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.registerUser(
      name: name,
      email: email,
      password: password,
    );
  }
}
