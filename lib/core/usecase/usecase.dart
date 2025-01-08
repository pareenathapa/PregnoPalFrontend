import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../failure/error_handler.dart';

/// An abstract class that represents a use case in the application.
///
/// The `UseCase` class defines a contract for executing a particular business logic
/// or functionality, typically within the domain layer of an application. It uses
/// the `Either` type from the Dartz library to encapsulate the result, which can be
/// either a successful outcome of type `Type` or an error of type `AppErrorHandler`.
///
/// This class is designed to be extended by concrete use cases, where specific
/// implementations of the `call` method will define the exact behavior and logic.
///
/// Example usage:
/// ```dart
/// class GetUserProfileUseCase extends UseCase<UserProfile, GetUserProfileParams> {
///   @override
///   FutureOr<Either<AppErrorHandler, UserProfile>> call(GetUserProfileParams params) {
///     // Implementation for retrieving a user profile
///   }
/// }
/// ```
///
/// [Type]: The expected result type on a successful outcome.
/// [Params]: The type of parameters that the use case requires for execution.
abstract class UseCase<Type, Params> {
  /// The method that needs to be implemented by any concrete use case.
  ///
  /// This method is called to execute the use case with the provided parameters.
  /// It returns a `FutureOr` of `Either` containing either an `AppErrorHandler`
  /// in case of failure, or a result of type `Type` in case of success.
  ///
  /// [params]: The parameters required to execute the use case.
  ///
  /// Returns a `FutureOr<Either<AppErrorHandler, Type>>` indicating the outcome of the operation.
  FutureOr<Either<AppErrorHandler, Type>> call(Params params);
}
