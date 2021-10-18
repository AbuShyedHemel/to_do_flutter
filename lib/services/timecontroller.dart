import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class TimeController extends GetxController {
  // ignore: prefer_final_fields, unused_field
  var startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  var endTime ="9:30 PM";
  getTimeFromUser({required bool isStartTime,required BuildContext context})async{
    var picketTime = await _showTimePicker(context);
    var _formattedTime = picketTime.format(context);
    if(picketTime==null){
      print("Time Cancled");
    }else if(isStartTime ==true){
      startTime=_formattedTime;
    }else if(isStartTime==false){
      endTime=_formattedTime;
    }
  }

  _showTimePicker(BuildContext context){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(startTime.split(":")[0]), 
        minute: int.parse(startTime.split(":")[1].split(" ")[0]),)
    );
  }
}