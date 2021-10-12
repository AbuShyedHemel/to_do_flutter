// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_push_notification/controller/appbarcontroller.dart';

class Addtaskpage extends StatelessWidget {
  const Addtaskpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBarControllers(
        onTap: (){
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
      ).appBar(context),
    );
  }
}