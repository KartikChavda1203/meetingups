// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:meetingups/screens/controller/homeController.dart';
import 'package:meetingups/screens/models/FindAllMeetingModalData.dart';
import 'package:meetingups/screens/view/homeScreens.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiClass {
  HomeController homeController = Get.put(HomeController());

  var token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YjY2Y2ZmNTNjODViYzEyNmY3NzYzYyIsInVzZXJuYW1lIjoiR2lvdmFubmE4IiwiaWF0IjoxNjg5Njc3MzAyLCJleHAiOjE2OTAyNzczMDJ9.jow_mxUUj2noeIZjccOBbGuZY3ckTswmMg0wbKbK0v0';

  Future<void> login(String username, String password) async {
    final bodys = {"username": "Giovanna8", "password": "A1DWkuvmwvCIJQh"};
    final header = {
      'Content-Type': 'application/json',
      'accept': 'application/json'
    };

    if (username.isNotEmpty && password.isNotEmpty) {
      var url =
      Uri.parse('https://8b0e09-cate-sandbox.dhiwise.co/device/auth/login');
      var response =
      await http.post(url, body: jsonEncode(bodys), headers: header);

      if (response.statusCode == 200) {
        // Login successful, handle the response

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("login", token);
        Get.snackbar("SUCCESS", "Login Successfully",
            backgroundColor: Colors.white);
        Get.to(const HomeScreen());
      } else {
        // Login failed, handle the error
        Get.showSnackbar(
          const GetSnackBar(
            title: 'OOPS',
            message: 'Something went wrong',
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'SORRY',
          message: 'Blank Value Found',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> addMeeting(
      String meetingtitle,
      String meetingdate,
      String meetingfrom,
      String meetingto,
      String expectedmember,
      String meetingid,
      String meetingdescription,
      String meetingimage,
      ) async {
    final body = {
      "space_id": "64b66e37edc614a01a8f64bf",
      "user_id": "64b66cff53c85bc126f7763c",
      "meeting_title": meetingtitle,
      "meeting_date": meetingdate,
      "meeting_from": meetingfrom,
      "meeting_to": meetingto,
      "expected_member": int.parse(expectedmember),
      "meeting_id": int.parse(meetingid),
      "meeting_description": meetingdescription,
      "meeting_image": meetingimage
    };
    final header = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    if (meetingtitle.isNotEmpty &&
        meetingdescription.isNotEmpty &&
        meetingdate.isNotEmpty &&
        meetingfrom.isNotEmpty &&
        meetingto.isNotEmpty &&
        expectedmember.isNotEmpty &&
        meetingid.isNotEmpty &&
        meetingimage.isNotEmpty) {
      var url = Uri.parse(
          'https://8b0e09-cate-sandbox.dhiwise.co/device/api/v1/meeting/create');
      var response =
      await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        // Data added successfully
        Get.snackbar("SUCCESS", "Your request is successfully executed",
            backgroundColor: Colors.white);
        findAllMeeting();
        await Get.to(const HomeScreen());
      } else {
        // Failed to add data
        Get.snackbar("OOPS", "Please Check Your Data",
            backgroundColor: Colors.white);
      }
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'SORRY',
          message: 'Blank Value Found',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> findAllMeeting() async {
    try {
      var url = Uri.parse('https://8b0e09-cate-sandbox.dhiwise.co/device/api/v1/meeting/list');
      var response = await http.post(
        url,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        FindAllMeetingModalData findAllMeetingModalData =
        FindAllMeetingModalData.fromJson(jsonDecode(response.body));

        // Clear the existing meeting list
        homeController.findmeeting.clear();

        // Add the new data to the meeting list
        homeController.findmeeting.addAll(findAllMeetingModalData.data.data);

        // Sort the meeting list
        sortData();
      } else {
        throw Exception('Something went wrong. Please check your data.');
      }
    } catch (e) {
      throw Exception('Failed to fetch meeting data: $e');
    }
  }

  Future<void> updateData(
      String editTitle,
      String editDate,
      String editFrom,
      String editTo,
      int editExpectedMember,
      int editMeetingid,
      String editDescription,
      String editImage,
      String id,
      ) async {
    final body = {
      "space_id": "64b66e37edc614a01a8f64bf",
      "user_id": "64b66cff53c85bc126f7763c",
      "meeting_title": editTitle,
      "meeting_date": editDate,
      "meeting_from": editFrom,
      "meeting_to": editTo,
      "expected_member": editExpectedMember,
      "meeting_id": editMeetingid,
      "meeting_description": editDescription,
      "meeting_image": editImage,
      "isDeleted": false,
      "id": id
    };
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.parse(
        'https://8b0e09-cate-sandbox.dhiwise.co/device/api/v1/meeting/update/$id');

    var response = await http.put(url, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 200) {
      // Data update successful
      Get.to(const HomeScreen());
      await findAllMeeting();
      sortData();

    } else {
      // Data update failed
      Get.snackbar("OOPS", "Your Data is Not Updated",
          backgroundColor: Colors.white);
      throw jsonDecode(response.body)['meta']["message"] ?? "Unknown Error Occurred";
    }
  }


  Future<void> deleteData(String id) async {
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var url = Uri.parse(
        'https://8b0e09-cate-sandbox.dhiwise.co/device/api/v1/meeting/delete/$id');
    var response = await http.delete(url, headers: headers);

    if (response.statusCode == 200) {
      // Data deletion successful
      Get.snackbar("Deleted", "Your Data is Successfully Deleted",
          backgroundColor: Colors.white);
      findAllMeeting();
    } else {
      // Data deletion failed
      Get.snackbar("OOPS", "Your Data is Not Deleted",
          backgroundColor: Colors.white);
      throw jsonDecode(response.body)['meta']["message"] ??
          "Unknown Error Occurred";
    }
  }

  void sortData() {
    // Sort the meeting list based on meeting date and time
    homeController.findmeeting.sort((a, b) {
      // Convert meeting date and time strings to DateTime objects for comparison
      DateTime dateA = DateFormat('dd/MM/yyyy hh:mm a').parse('${a.meetingDate} ${a.meetingFrom}');
      DateTime dateB = DateFormat('dd/MM/yyyy hh:mm a').parse('${b.meetingDate} ${b.meetingFrom}');

      return dateA.compareTo(dateB);
    });
  }

}
