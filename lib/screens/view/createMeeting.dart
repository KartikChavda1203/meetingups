import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetingups/apihelper/apiHelperClass.dart';
import 'package:meetingups/screens/controller/homeController.dart';

class CreateMeeting extends StatefulWidget {
  const CreateMeeting({super.key});

  @override
  State<CreateMeeting> createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  ApiClass apiClass = ApiClass();
  HomeController homeController = Get.put(HomeController());
  var index = Get.arguments;
  var spaceIdController = TextEditingController();
  var userIdController = TextEditingController();
  var meetingtitleController = TextEditingController();
  var meetingFromController = TextEditingController(
      text: DateFormat.jm().format(DateTime.now()).toString());
  var meetingtoController = TextEditingController(
      text: DateFormat.jm().format(DateTime.now()).toString());
  var dateController = TextEditingController();
  var expectedmemberController = TextEditingController();
  var meetingIdController = TextEditingController();
  var meetingdiscriptionController = TextEditingController();
  var meetingImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (index != null) {
      meetingtitleController = TextEditingController(
          text: homeController.findmeeting[index].meetingTitle);
      meetingdiscriptionController = TextEditingController(
          text: homeController.findmeeting[index].meetingDescription);
      dateController = TextEditingController(
          text: homeController.findmeeting[index].meetingDate);
      meetingFromController = TextEditingController(
          text: homeController.findmeeting[index].meetingFrom.toString());
      meetingtoController = TextEditingController(
          text: homeController.findmeeting[index].meetingTo.toString());
      expectedmemberController = TextEditingController(
          text: homeController.findmeeting[index].expectedMember.toString());
      meetingImageController = TextEditingController(
          text: homeController.findmeeting[index].meetingImage);
      meetingIdController = TextEditingController(
          text: homeController.findmeeting[index].meetingId.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Icon(Icons.arrow_back_ios, size: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      index != null ? 'Update Meeting' : 'Create Meeting',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Title",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Container(
                  height: 52,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          autofocus: false,
                          controller: meetingtitleController,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600]),
                          decoration: InputDecoration(
                            hintText: 'Enter your Title',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600]),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Description",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Container(
                  height: 52,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          autofocus: false,
                          controller: meetingdiscriptionController,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600]),
                          decoration: InputDecoration(
                            hintText: 'Enter your Description',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600]),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Date",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Container(
                  height: 52,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          //  readOnly: widget == null ? false : true,
                          autofocus: false,
                          controller: dateController,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600]),
                          decoration: InputDecoration(
                              hintText: DateFormat('dd/MM/yyyy')
                                  .format(DateTime.now()),
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[600]),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.white)),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 0, color: Colors.white)),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  _getDateFromUser();
                                },
                                icon: const Icon(Icons.calendar_month),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Meeting From",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Container(
                            height: 52,
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.only(left: 14),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[600]),
                                    decoration: InputDecoration(
                                        hintText: meetingFromController.text,
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[600]),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: Colors.white)),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: Colors.white)),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            _selectTime(context, true);
                                          },
                                          icon: const Icon(
                                            Icons.access_time_rounded,
                                            color: Colors.grey,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Meeting To",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Container(
                            height: 52,
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.only(left: 14),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    readOnly: true,
                                    autofocus: false,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[600]),
                                    decoration: InputDecoration(
                                        hintText: meetingtoController.text,
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[600]),
                                        focusedBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: Colors.white)),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 0,
                                                    color: Colors.white)),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            _selectTime(context, false);
                                          },
                                          icon: const Icon(
                                            Icons.access_time_rounded,
                                            color: Colors.grey,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Meeting Image",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Container(
                  height: 52,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textCapitalization: TextCapitalization.words,
                          controller: meetingImageController,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600]),
                          decoration: InputDecoration(
                            hintText: 'Enter image',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600]),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Expected Member",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Container(
                  height: 52,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: expectedmemberController,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600]),
                          decoration: InputDecoration(
                            hintText: 'Enter expected members',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600]),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Meeting Id",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Container(
                  height: 52,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: meetingIdController,
                          autofocus: false,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600]),
                          decoration: InputDecoration(
                            hintText: 'Enter your id',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[600]),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(width: 0, color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            index != null
                ? apiClass.updateData(
                    meetingtitleController.text,
                    dateController.text,
                    meetingFromController.text,
                    meetingtoController.text,
                    expectedmemberController.hashCode,
                    meetingIdController.hashCode,
                    meetingdiscriptionController.text,
                    meetingImageController.text,
                    homeController.findmeeting[index].id)
                : apiClass.addMeeting(
                    meetingtitleController.text,
                    dateController.text,
                    meetingFromController.text,
                    meetingtoController.text,
                    expectedmemberController.text,
                    meetingIdController.text,
                    meetingdiscriptionController.text,
                    meetingImageController.text,
                  );
          },
          label: Text(index != null ? 'Update Meeting' : 'Create Meeting'),
        ),
      ),
    );
  }

  _getDateFromUser() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 10);
    final pickedDate = await showDatePicker(
      context: Get.overlayContext!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final String formattedTime = selectedTime.format(context);
      setState(() {
        if (isStartTime) {
          meetingFromController.text = formattedTime;
        } else {
          meetingtoController.text = formattedTime;
        }
      });
    }
  }
}
