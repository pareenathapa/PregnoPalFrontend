import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../authentication/data/models/user_model.dart';
import 'child_model.dart';

class ProfileModel {
  final UserModel user;
  final List<ChildModel> children;
  ProfileModel({
    required this.user,
    required this.children,
  });

  ProfileModel copyWith({
    UserModel? user,
    List<ChildModel>? children,
  }) {
    return ProfileModel(
      user: user ?? this.user,
      children: children ?? this.children,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'children': children.map((x) => x.toMap()).toList(),
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      user: UserModel.fromMap(map['user']),
      children: List<ChildModel>.from(
        map['children']?.map((x) => ChildModel.fromMap(x)) ?? const [],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source));

  @override
  String toString() => 'ProfileModel(user: $user, children: $children)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.user == user &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode => user.hashCode ^ children.hashCode;
}
