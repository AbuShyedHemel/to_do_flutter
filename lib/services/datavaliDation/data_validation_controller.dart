import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_push_notification/controller/task_controller.dart';
import 'package:local_push_notification/model/task.dart';
import 'package:local_push_notification/services/timecontroller.dart';

class DatavalidationController{
TextEditingController titleController = TextEditingController();
TextEditingController noteController = TextEditingController();
DateTime selectedDate;
final timeCOntroller = Get.put(TimeController());
int reminder;
String repeat;
int selectColor;
  final TaskController _taskController = Get.put(TaskController());

 DatavalidationController(
   {required this.titleController, 
   required this.noteController,
   required this.selectedDate,
   required this.reminder,
   required this.repeat,
   required this.selectColor,
   });

 validateDate(){
   if(titleController.text.isNotEmpty&&noteController.text.isNotEmpty){
     _addTaskToDB();
     Get.back();
   }else if(titleController.text.isEmpty || noteController.text.isEmpty){
     Get.snackbar("Required", "All Fields are Required",
     snackPosition: SnackPosition.BOTTOM,
     backgroundColor: Colors.red,
     icon: const Icon(Icons.warning));
   }
 }
 _addTaskToDB()async{
   int? value =await _taskController.addTask(
     task:Task(
     note: noteController.text,
     title: titleController.text,
     date: DateFormat.yMd().format(selectedDate),
     startTime: timeCOntroller.startTime.toString(),
     endTime: timeCOntroller.endTime.toString(),
     remind: reminder,
     repeat: repeat,
     color: selectColor,
     isCompleted: 0,
   )
   );
   print("Id is "+"$value");
 }
  
}