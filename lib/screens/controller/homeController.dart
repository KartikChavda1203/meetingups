// ignore_for_file: file_names
import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetingups/screens/models/FindAllMeetingModalData.dart';

class HomeController extends GetxController {
  RxList<Datum> findmeeting = <Datum>[].obs;
  RxBool isLoading = false.obs;

  String dateTimeString2 = '18/07/2023 7:00 PM';
  Duration duration = const Duration();
  Timer? _timer;
  String remainingTime = '';

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    final DateTime now = DateTime.now();
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy hh:mm a');
    final DateTime dateTime2 = dateFormat.parse(dateTimeString2);

    if (dateTime2.isAfter(now)) {
      duration = dateTime2.difference(now);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (duration.inSeconds <= 0) {
          timer.cancel();
          // Timer has completed, perform any necessary actions here
          remainingTime = "Meeting Completed";
        } else {
          duration = duration - const Duration(seconds: 1);
          remainingTime = formatTime(duration);
        }
        update();
      });
    } else {
      // Meeting has already passed, handle accordingly
      remainingTime = "Meeting Completed";
      update();
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

/*if (findmeeting.isNotEmpty) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(findmeeting[0].meetingDate));
      dateTimeString2 = formattedDate + ' ${findmeeting[0].meetingFrom}';
      startTimer();
    }*/
