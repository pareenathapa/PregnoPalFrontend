import 'dart:convert';

import 'package:flutter/widgets.dart';
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
      role: params.role,
      specialization: params.specialization,
      availableFrom: params.availableFrom,
      availableTo: params.availableTo,
    );
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String role;
  final String? specialization;
  final DateTime? availableFrom;
  final DateTime? availableTo;

  RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.specialization,
    this.availableFrom,
    this.availableTo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'specialization': specialization,
      'available_from': availableFrom?.millisecondsSinceEpoch,
      'available_to': availableTo?.millisecondsSinceEpoch,
    };
  }

  factory RegisterParams.fromMap(Map<String, dynamic> map) {
    return RegisterParams(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
      specialization: map['specialization'],
      availableFrom: map['available_from'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['available_from'])
          : null,
      availableTo: map['available_to'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['available_to'])
          : null,
    );
  }

  RegisterParams copyWith({
    String? name,
    String? email,
    String? password,
    String? role,
    ValueGetter<String?>? specialization,
    ValueGetter<DateTime?>? availableFrom,
    ValueGetter<DateTime?>? availableTo,
  }) {
    return RegisterParams(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      specialization:
          specialization != null ? specialization() : this.specialization,
      availableFrom:
          availableFrom != null ? availableFrom() : this.availableFrom,
      availableTo: availableTo != null ? availableTo() : this.availableTo,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterParams.fromJson(String source) =>
      RegisterParams.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterParams(name: $name, email: $email, password: $password, role: $role, specialization: $specialization, availableFrom: $availableFrom, availableTo: $availableTo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterParams &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.role == role &&
        other.specialization == specialization &&
        other.availableFrom == availableFrom &&
        other.availableTo == availableTo;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        role.hashCode ^
        specialization.hashCode ^
        availableFrom.hashCode ^
        availableTo.hashCode;
  }
}
