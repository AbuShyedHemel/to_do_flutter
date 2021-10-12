import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_push_notification/controller/appbarcontroller.dart';
import 'package:local_push_notification/controller/notificationController.dart';
import 'package:local_push_notification/controller/themeservices.dart';
import 'package:local_push_notification/view/taskPage/add_task_page.dart';
import 'package:local_push_notification/view/widgets/add_tasks.dart';
import 'package:local_push_notification/view/widgets/button.dart';
import 'package:local_push_notification/view/widgets/time_Setter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var notifyHelper;
  DateTime _selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifiyHelper();
    notifyHelper.initilizeNotification();
  }

  final appbarcontroller = AppBarControllers(
    onTap: () {
      ThemeServices().switchTheme();
      NotifiyHelper().displayNotification(
          title: "Theme Changed",
          body: Get.isDarkMode ? "Light Activated" : "Dark Activated");
    },
    icon: Icon(
      Icons.nightlight_outlined,
      size: 20,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: appbarcontroller.appBar(context),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              AddTask(),
              ScrollTime(
                onDateChanger: _selectedDate,
              ),
            ],
          ),
          MyButton(
              lable: "+ Add Task",
              onTap: () {
                Get.to(() => const Addtaskpage());
              })
        ],
      ),
    );
  }
}
