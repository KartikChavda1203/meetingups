// To parse this JSON data, do
//
//     final addMeetingModelData = addMeetingModelDataFromJson(jsonString);

import 'dart:convert';

AddMeetingModelData addMeetingModelDataFromJson(String str) => AddMeetingModelData.fromJson(json.decode(str));

String addMeetingModelDataToJson(AddMeetingModelData data) => json.encode(data.toJson());

class AddMeetingModelData {
  String status;
  String message;
  Data data;

  AddMeetingModelData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddMeetingModelData.fromJson(Map<String, dynamic> json) => AddMeetingModelData(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String spaceId;
  String userId;
  String meetingTitle;
  String meetingDate;
  String meetingFrom;
  String meetingTo;
  int expectedMember;
  int meetingId;
  String meetingDescription;
  String meetingImage;
  bool isDeleted;
  String id;

  Data({
    required this.spaceId,
    required this.userId,
    required this.meetingTitle,
    required this.meetingDate,
    required this.meetingFrom,
    required this.meetingTo,
    required this.expectedMember,
    required this.meetingId,
    required this.meetingDescription,
    required this.meetingImage,
    required this.isDeleted,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    spaceId: json["space_id"],
    userId: json["user_id"],
    meetingTitle: json["meeting_title"],
    meetingDate: json["meeting_date"],
    meetingFrom: json["meeting_from"],
    meetingTo: json["meeting_to"],
    expectedMember: json["expected_member"],
    meetingId: json["meeting_id"],
    meetingDescription: json["meeting_description"],
    meetingImage: json["meeting_image"],
    isDeleted: json["isDeleted"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "space_id": spaceId,
    "user_id": userId,
    "meeting_title": meetingTitle,
    "meeting_date": meetingDate,
    "meeting_from": meetingFrom,
    "meeting_to": meetingTo,
    "expected_member": expectedMember,
    "meeting_id": meetingId,
    "meeting_description": meetingDescription,
    "meeting_image": meetingImage,
    "isDeleted": isDeleted,
    "id": id,
  };
}
