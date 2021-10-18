// ignore_for_file: file_names

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_push_notification/services/themes/themes.dart';

class ScrollTime extends StatelessWidget {
  DateTime onDateChanger;
  ScrollTime({ Key? key,required this.onDateChanger }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           
    Container(
            margin: const EdgeInsets.only(right:20,top: 10,left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: primaryClr,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.lato(
                textStyle:const  TextStyle( fontSize: 20, 
              fontWeight:FontWeight.w500,
              color: Colors.grey
              )
              ),
              dayTextStyle: GoogleFonts.lato(
                textStyle:const  TextStyle( fontSize: 16, 
              fontWeight:FontWeight.w500,
              color: Colors.grey
              )
              ),
              monthTextStyle: GoogleFonts.lato(
                textStyle:const  TextStyle( fontSize: 14, 
              fontWeight:FontWeight.w500,
              color: Colors.grey
              )
              ),
              onDateChange: (date){
                onDateChanger = date;
              },

            ),
          );
  }
}