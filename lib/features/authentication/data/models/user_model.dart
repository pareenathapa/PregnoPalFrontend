import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../../../../config/constants/api/api_endpoints_constants.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String token;
  final String picture;
  final DateTime? availableFrom;
  final DateTime? availableTo;
  final String? specialization;
  final String role;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
    required this.picture,
    this.availableFrom,
    this.availableTo,
    this.specialization,
    required this.role,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? token,
    String? picture,
    ValueGetter<DateTime?>? availableFrom,
    ValueGetter<DateTime?>? availableTo,
    ValueGetter<String?>? specialization,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      token: token ?? this.token,
      picture: picture ?? this.picture,
      availableFrom:
          availableFrom != null ? availableFrom() : this.availableFrom,
      availableTo: availableTo != null ? availableTo() : this.availableTo,
      specialization:
          specialization != null ? specialization() : this.specialization,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
      'token': token,
      'picture': picture,
      'available_from': availableFrom?.millisecondsSinceEpoch,
      'available_to': availableTo?.millisecondsSinceEpoch,
      'specialization': specialization,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
      token: map['token'] ?? '',
      picture: map["picture"].toString().startsWith("/uploads")
          ? "${ApiEndpoints.baseDomain}${map["picture"]}"
          : map["picture"],
      availableFrom: map['available_from'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['available_from'])
          : null,
      availableTo: map['available_to'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['available_to'])
          : null,
      specialization: map['specialization'],
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, token: $token, picture: $picture, availableFrom: $availableFrom, availableTo: $availableTo, specialization: $specialization, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.token == token &&
        other.picture == picture &&
        other.availableFrom == availableFrom &&
        other.availableTo == availableTo &&
        other.specialization == specialization &&
        other.role == role;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        token.hashCode ^
        picture.hashCode ^
        availableFrom.hashCode ^
        availableTo.hashCode ^
        specialization.hashCode ^
        role.hashCode;
  }
}
