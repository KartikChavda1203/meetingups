// To parse this JSON data, do
//
//     final findAllMeetingModalData = findAllMeetingModalDataFromJson(jsonString);

import 'dart:convert';

FindAllMeetingModalData findAllMeetingModalDataFromJson(String str) => FindAllMeetingModalData.fromJson(json.decode(str));

String findAllMeetingModalDataToJson(FindAllMeetingModalData data) => json.encode(data.toJson());

class FindAllMeetingModalData {
  FindAllMeetingModalData({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory FindAllMeetingModalData.fromJson(Map<String, dynamic> json) => FindAllMeetingModalData(
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
  Data({
    required this.data,
    required this.paginator,
  });

  List<Datum> data;
  Paginator paginator;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    paginator: Paginator.fromJson(json["paginator"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "paginator": paginator.toJson(),
  };
}

class Datum {
  Datum({
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
    required this.id,
    required this.isDeleted,
  });

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
  String id;
  bool isDeleted;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    id: json["id"],
    isDeleted: json["isDeleted"],
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
    "id": id,
    "isDeleted": isDeleted,
  };
}

class Paginator {
  Paginator({
    required this.itemCount,
    required this.offset,
    required this.perPage,
    required this.pageCount,
    required this.currentPage,
    required this.slNo,
    required this.hasPrevPage,
    required this.hasNextPage,
    this.prev,
    this.next,
  });

  int itemCount;
  int offset;
  int perPage;
  int pageCount;
  int currentPage;
  int slNo;
  bool hasPrevPage;
  bool hasNextPage;
  dynamic prev;
  dynamic next;

  factory Paginator.fromJson(Map<String, dynamic> json) => Paginator(
    itemCount: json["itemCount"],
    offset: json["offset"],
    perPage: json["perPage"],
    pageCount: json["pageCount"],
    currentPage: json["currentPage"],
    slNo: json["slNo"],
    hasPrevPage: json["hasPrevPage"],
    hasNextPage: json["hasNextPage"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "itemCount": itemCount,
    "offset": offset,
    "perPage": perPage,
    "pageCount": pageCount,
    "currentPage": currentPage,
    "slNo": slNo,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prev": prev,
    "next": next,
  };
}
