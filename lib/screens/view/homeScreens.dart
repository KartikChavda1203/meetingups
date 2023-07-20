// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meetingups/apihelper/apiHelperClass.dart';
import 'package:meetingups/screens/controller/homeController.dart';
import 'package:meetingups/screens/view/createMeeting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiClass apiClass = ApiClass();
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    apiClass.findAllMeeting();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat.yMMMd().format(DateTime.now()),
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xff606060))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "UPCOMING MEETING",
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 4,
                              color: Colors.black12,
                            ),
                          ]),
                      child: Center(
                        child: GetBuilder<HomeController>(
                          builder: (controller) {
                            return Text(
                              homeController.remainingTime,
                              style: const TextStyle(
                                fontSize: 24.0,
                                letterSpacing: 3,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                      () =>
                  homeController.findmeeting.isEmpty
                      ? Container()
                      : Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 4,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              homeController.findmeeting[0].meetingTitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                homeController.findmeeting[0]
                                    .meetingDescription),
                            trailing: const CircleAvatar(
                              maxRadius: 35,
                              backgroundImage: NetworkImage(
                                  "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg"),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              thickness: 1,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      color: Colors.black54,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      homeController.findmeeting[0].meetingDate,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time_rounded,
                                      color: Colors.black54,
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Text(
                                      homeController.findmeeting[0].meetingFrom,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Text(
                                      "To",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      homeController.findmeeting[0].meetingTo,
                                      style: const TextStyle(
                                          color: Colors.black54),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    PopupMenuButton(
                                      itemBuilder: (BuildContext bc) {
                                        return [
                                          const PopupMenuItem(
                                            value: '/delete',
                                            child: Row(
                                              children: [
                                                Icon(Icons.delete),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Delete")
                                              ],
                                            ),
                                          ),
                                          const PopupMenuItem(
                                            value: '/edit',
                                            child: Row(
                                              children: [
                                                Icon(Icons.edit),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Edit")
                                              ],
                                            ),
                                          ),
                                        ];
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "TODAY'S MEETING",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Obx(() {
                    if (homeController.isLoading.value) {
                      // Display a loading indicator while data is being fetched
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else if (homeController.findmeeting.isEmpty) {
                      // Display a message if no meetings are available
                      return const Center(
                        child: Text('No meetings found.'),
                      );
                    }
                    else {
                      // Display the list of meetings using ListView.builder
                      return ListView.builder(
                        itemCount: homeController.findmeeting.length,
                        itemBuilder: (context, index) {
                          final meeting = homeController.findmeeting[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  color: Colors.black12,
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      meeting.meetingTitle,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                        meeting.meetingDescription),
                                    trailing: const CircleAvatar(
                                      maxRadius: 35,
                                      backgroundImage: NetworkImage(
                                          "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg"),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Divider(
                                      thickness: 1,
                                      height: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8, left: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              color: Colors.black54,
                                              size: 18,
                                            ),
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            Text(
                                              meeting.meetingDate,
                                              style: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 7,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.access_time_rounded,
                                              color: Colors.black54,
                                              size: 18,
                                            ),
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            Text(
                                              meeting.meetingFrom,
                                              style: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            const Text(
                                              "To",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              meeting.meetingTo,
                                              style: const TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            PopupMenuButton(
                                              onSelected: (value) {
                                                if (value == 'edit') {
                                                  Get.to(const CreateMeeting(),
                                                      arguments: index);
                                                }
                                                else if (value == 'delete') {
                                                  apiClass.deleteData(
                                                      meeting.id);
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.more_vert,
                                                color: Colors.black,
                                              ),
                                              itemBuilder: (context) {
                                                return [
                                                  const PopupMenuItem(
                                                    value: 'edit',
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.edit),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text("Edit")
                                                      ],
                                                    ),
                                                  ),
                                                  const PopupMenuItem(
                                                    value: 'delete',
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.delete),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text("Delete")
                                                      ],
                                                    ),
                                                  ),
                                                ];
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Get.to(const CreateMeeting());
              },
              label: const Text("Add Meeting")),
        ));
  }

}
