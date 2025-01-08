import 'dart:convert';

class ChildModel {
  final String name;
  final String dateOfBirth;
  final String sex;
  final double height;
  final double weight;
  ChildModel({
    required this.name,
    required this.dateOfBirth,
    required this.sex,
    required this.height,
    required this.weight,
  });

  ChildModel copyWith({
    String? name,
    String? dateOfBirth,
    String? sex,
    double? height,
    double? weight,
  }) {
    return ChildModel(
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      sex: sex ?? this.sex,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date_of_birth': dateOfBirth,
      'sex': sex,
      'height': height,
      'weight': weight,
    };
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      name: map['name'] ?? '',
      dateOfBirth: map['date_of_birth'] ?? '',
      sex: map['sex'] ?? '',
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildModel.fromJson(String source) =>
      ChildModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChildModel(name: $name, dateOfBirth: $dateOfBirth, sex: $sex, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChildModel &&
        other.name == name &&
        other.dateOfBirth == dateOfBirth &&
        other.sex == sex &&
        other.height == height &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dateOfBirth.hashCode ^
        sex.hashCode ^
        height.hashCode ^
        weight.hashCode;
  }
}
