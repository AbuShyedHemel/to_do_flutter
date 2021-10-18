// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_push_notification/controller/task_controller.dart';
import 'package:local_push_notification/services/appbar/appbarcontroller.dart';
import 'package:local_push_notification/services/datavaliDation/data_validation_controller.dart';
import 'package:local_push_notification/services/themes/themes.dart';
import 'package:local_push_notification/services/timecontroller.dart';
import 'package:local_push_notification/view/taskPage/selectColor/selected_color.dart';
import 'package:local_push_notification/view/widgets/button.dart';
import 'package:local_push_notification/view/widgets/input_field.dart';

class Addtaskpage extends StatefulWidget {
  const Addtaskpage({ Key? key }) : super(key: key);

  @override
  State<Addtaskpage> createState() => _AddtaskpageState();
}

class _AddtaskpageState extends State<Addtaskpage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  //String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  final timeCOntroller = Get.put(TimeController());
  int _selctReminder = 5;
  List<int> reminderList = [
    5,
    10,
    15,
    20
  ];
  String _selectedRepeat = "None";
   List<String> repeatList = [
    "None",
    "Daily",
    "Weakly",
    "Monthly"
  ];
  int _selectedColor = 0;


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
        icon:Icon(
          Icons.arrow_back,
          size: 20,
          color: Get.isDarkMode? Colors.white : Colors.black,
          )
      ).appBar(context),

      body: Container(
        margin: const EdgeInsets.only(left:20, right: 20,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Task',style: HeadingStyle),
              Inputfield(title: 'Title',hint: 'Enter your title',controller: _titleController,),
              Inputfield(title: 'Note',hint: 'Enter your Note',controller: _noteController,),
              Inputfield(title: 'Date', hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                onPressed: (){
                  getDateFromUser(context);
                }, icon:const Icon(Icons.calendar_today_outlined,color: Colors.deepOrangeAccent,))
              ),
              Row(
                children: [
                  /////Start Time///////
                  Expanded(
                    child: Inputfield(
                          title: "Start Time",
                          hint:timeCOntroller.startTime.toString(),
                          widget: IconButton(
                            onPressed: (){
                              timeCOntroller.getTimeFromUser(isStartTime: true, context: context);
                            },
                            icon: const Icon(Icons.access_time)
                          )
                        )
                    
                    ),
                  const SizedBox(width: 20,),
                  //////End Time///////
                  Expanded(
                    child: Inputfield(
                      title: "End Time",
                      hint: timeCOntroller.endTime.toString(),
                      widget: IconButton(
                        onPressed: (){
                          TimeController().getTimeFromUser(isStartTime: false, context: context);
                        },
                        icon: const Icon(Icons.access_time)
                      )
                    )),
                ]
              ),
              ////Reminder////
              Inputfield(title: "Remind", hint: '$_selctReminder minutes early',
              widget: DropdownButton(
                icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                iconSize: 32,
                elevation: 4,
                style: subTitleStyle,
                underline: Container(
                  height:0
                ),
                onChanged: (String? newValue){
                  setState(() {
                    _selctReminder = int.parse(newValue!);
                  });
                },
                items: reminderList.map<DropdownMenuItem<String>>((int value){
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                }).toList(),
                
              ),
              ),
              ////Repeat/////
              Inputfield(title: "Repeat", hint: _selectedRepeat,
              widget: DropdownButton(
                icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                iconSize: 32,
                elevation: 4,
                style: subTitleStyle,
                underline: Container(
                  height:0
                ),
                onChanged: (String? newValue){
                  setState(() {
                    _selectedRepeat = newValue!;
                  });
                },
                items: repeatList.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                
              ),
              ),
              /////Color&Button///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Selectedcolor(),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: MyButton(lable: "Creat Task",
                    onTap: (){
                      DatavalidationController(
                        titleController:_titleController,
                        noteController:_noteController,
                        selectedDate: _selectedDate,
                        reminder: _selctReminder,
                        repeat: _selectedRepeat,
                        selectColor: _selectedColor,

                        ).validateDate();
                    }
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    
  }
  
}