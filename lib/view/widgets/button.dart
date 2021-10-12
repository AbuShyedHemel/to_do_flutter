import 'package:flutter/material.dart';
import 'package:local_push_notification/controller/themes/themes.dart';

class MyButton extends StatelessWidget {
  final String lable;
  final Function() onTap;

  const MyButton({Key? key,required this.lable,required this.onTap}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:90,
        height:60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryClr
        ),
        child: Center(
          child: Text(
            lable,
            style:
             TextStyle(color: Colors.white),))
      ),
    );
  }
}