// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_push_notification/controller/appbarcontroller.dart';
import 'package:local_push_notification/controller/themes/themes.dart';
import 'package:local_push_notification/view/widgets/input_field.dart';

class Addtaskpage extends StatefulWidget {
  const Addtaskpage({ Key? key }) : super(key: key);

  @override
  State<Addtaskpage> createState() => _AddtaskpageState();
}

class _AddtaskpageState extends State<Addtaskpage> {
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();




  getDateFromUser(BuildContext context, )async{
    DateTime? _pickerDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2015), 
      lastDate: DateTime(2121));
      if(_pickerDate != null) {
        setState(() {
          _selectedDate = _pickerDate;
        });
      }
  }
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

      body: Container(
        margin: const EdgeInsets.only(left:20, right: 20,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Task',style: HeadingStyle),
              const Inputfield(title: 'Title',hint: 'Enter your title'),
              const Inputfield(title: 'Note',hint: 'Enter your Note'),
              Inputfield(title: 'Date', hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                onPressed: (){
                  getDateFromUser(context);
                }, icon:const Icon(Icons.calendar_today_outlined,color: Colors.deepOrangeAccent,))
              ),
              Row(
                children: [
                  Expanded(
                    child: Inputfield(
                      title: "Start Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: (){

                        },
                        icon: const Icon(Icons.access_time)
                      )
                    )),
                    SizedBox(width: 20,),
                    Expanded(
                    child: Inputfield(
                      title: "End Time",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: (){

                        },
                        icon: const Icon(Icons.access_time)
                      )
                    ))
                ]
              )
            ],
          ),
        ),
      ),
    );
    
  }
  
}