import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetingups/screens/view/createMeeting.dart';
import 'package:meetingups/screens/view/homeScreens.dart';
import 'package:meetingups/screens/view/loginScreen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const LoginScreen(),
      '/homeScreens': (context) => const HomeScreen(),
      '/createMeeting': (context) => const CreateMeeting(),
    },
  ));
}
