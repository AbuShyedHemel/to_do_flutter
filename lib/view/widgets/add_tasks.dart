import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_push_notification/services/themes/themes.dart';




class AddTask extends StatelessWidget {
  const AddTask({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(left: 20, right:20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now()),style: subHeadingStyle,),
                    Text("Today",style: HeadingStyle,),
                  ]
                ),
              ]
            ),
          );
  }
}