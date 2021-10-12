import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarControllers{
  final Function() onTap;
  final Icon icon;
  AppBarControllers({required this.onTap, required this.icon});
  appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor:context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: onTap,
         child: icon
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage('images/appbar_image.jpg'),
        ),
        SizedBox(width: 20,)
      ],
    );
  }
}