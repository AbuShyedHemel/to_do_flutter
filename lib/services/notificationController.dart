// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotifiyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  initilizeNotification() async {
    tz.initializeTimeZones();
    final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification
    );
    // ignore: prefer_const_constructors
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('notification');


    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: selectNotification
    );
  }
  Future onDidReceiveLocalNotification(int? id,String? title,String? body, String? playboy)async{
    Get.dialog(const Text("Welcome To Flutter"));
  }
  Future selectNotification(String? payLoad)async{
    if(payLoad != null){
      // ignore: avoid_print
      print('notification payload: $payLoad');
    }else{
      // ignore: avoid_print
      print("Notification Done");
    }
    // ignore: avoid_unnecessary_containers
    Get.to(()=>Container(
      // ignore: prefer_const_constructors
      child: Text("data"),
    ));
  }


  displayNotification({required String title, required String body})async{
    var androidfromChannelSpecificas = const AndroidNotificationDetails(
      'Your Channel Id', 'Your Channel Name',
      importance: Importance.max,priority: Priority.high);
    var platformChannelSpecifics =  NotificationDetails(
      android: androidfromChannelSpecificas);
    await flutterLocalNotificationsPlugin.show(
      0, 
      title, 
      body,
      platformChannelSpecifics,
      payload: 'Default_Sound');
  }
   scheduledNotification() async {
     await flutterLocalNotificationsPlugin.zonedSchedule(
         0,
         'scheduled title',
         'theme changes 5 seconds ago',
         tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
         const NotificationDetails(
             android: AndroidNotificationDetails('your channel id',
                 'your channel name')),
         androidAllowWhileIdle: true,
         uiLocalNotificationDateInterpretation:
             UILocalNotificationDateInterpretation.absoluteTime);

   }
}
