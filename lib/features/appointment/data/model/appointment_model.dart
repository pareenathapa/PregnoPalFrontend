import 'dart:convert';

import 'package:flutter/widgets.dart';

// const mongoose = require("mongoose");

// const appointmentSchema = new mongoose.Schema({
//   parent_id: {
//     type: mongoose.Schema.Types.ObjectId,
//     ref: "User",
//     required: true,
//   },
//   doctor_id: {
//     type: mongoose.Schema.Types.ObjectId,
//     ref: "Doctor",
//     required: true,
//   },
//   child_id: {
//     type: mongoose.Schema.Types.ObjectId,
//     ref: "Child",
//     required: true,
//   },
//   appointment_date: { type: Date, required: true },
//   mode: { type: String, enum: ["Physical", "Online"], required: true },
//   meeting_link: {
//     type: String,
//     required: function () {
//       return this.mode === "Online";
//     },
//   },
//   status: {
//     type: String,
//     enum: ["Pending", "Accepted", "Rejected", "Countered"],
//     default: "Pending",
//   },
//   counter_proposal_date: { type: Date, default: null },
//   counter_mode: { type: String, enum: ["Physical", "Online"], default: null },
//   created_at: { type: Date, default: Date.now },
//   updated_at: { type: Date, default: Date.now },
// });

// const Appointment = mongoose.model("Appointment", appointmentSchema);

// module.exports = Appointment;

class AppointmentModel {
  final String id;
  final String parentId;
  final String doctorId;
  final String childId;
  final DateTime appointmentDate;
  final String mode;
  final String? meetingLink;
  final String status;
  final DateTime? counterProposalDate;
  final String? counterMode;
  final DateTime createdAt;
  final DateTime updatedAt;
  AppointmentModel({
    required this.id,
    required this.parentId,
    required this.doctorId,
    required this.childId,
    required this.appointmentDate,
    required this.mode,
    this.meetingLink,
    required this.status,
    this.counterProposalDate,
    this.counterMode,
    required this.createdAt,
    required this.updatedAt,
  });

  AppointmentModel copyWith({
    String? id,
    String? parentId,
    String? doctorId,
    String? childId,
    DateTime? appointmentDate,
    String? mode,
    ValueGetter<String?>? meetingLink,
    String? status,
    ValueGetter<DateTime?>? counterProposalDate,
    ValueGetter<String?>? counterMode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppointmentModel(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      doctorId: doctorId ?? this.doctorId,
      childId: childId ?? this.childId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      mode: mode ?? this.mode,
      meetingLink: meetingLink != null ? meetingLink() : this.meetingLink,
      status: status ?? this.status,
      counterProposalDate: counterProposalDate != null
          ? counterProposalDate()
          : this.counterProposalDate,
      counterMode: counterMode != null ? counterMode() : this.counterMode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'parent_id': parentId,
      'doctor_id': doctorId,
      'child_id': childId,
      'appointment_date': appointmentDate.millisecondsSinceEpoch,
      'mode': mode,
      'meeting_link': meetingLink,
      'status': status,
      'counter_proposal_date': counterProposalDate?.millisecondsSinceEpoch,
      'counter_mode': counterMode,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] ?? '',
      parentId: map['parent_id'] ?? '',
      doctorId: map['doctor_id'] ?? '',
      childId: map['child_id'] ?? '',
      appointmentDate:
          DateTime.fromMillisecondsSinceEpoch(map['appointment_date']),
      mode: map['mode'] ?? '',
      meetingLink: map['meeting_link'],
      status: map['status'] ?? '',
      counterProposalDate: map['counter_proposal_date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['counter_proposal_date'])
          : null,
      counterMode: map['counter_mode'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppointmentModel(id: $id, parentId: $parentId, doctorId: $doctorId, childId: $childId, appointmentDate: $appointmentDate, mode: $mode, meetingLink: $meetingLink, status: $status, counterProposalDate: $counterProposalDate, counterMode: $counterMode, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppointmentModel &&
        other.id == id &&
        other.parentId == parentId &&
        other.doctorId == doctorId &&
        other.childId == childId &&
        other.appointmentDate == appointmentDate &&
        other.mode == mode &&
        other.meetingLink == meetingLink &&
        other.status == status &&
        other.counterProposalDate == counterProposalDate &&
        other.counterMode == counterMode &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        parentId.hashCode ^
        doctorId.hashCode ^
        childId.hashCode ^
        appointmentDate.hashCode ^
        mode.hashCode ^
        meetingLink.hashCode ^
        status.hashCode ^
        counterProposalDate.hashCode ^
        counterMode.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  static List<AppointmentModel> fromJsonList(data) {
    return List<AppointmentModel>.from(
        data.map((x) => AppointmentModel.fromMap(x)));
  }
}
