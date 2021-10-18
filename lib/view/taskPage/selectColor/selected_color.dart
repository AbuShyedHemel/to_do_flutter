// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:local_push_notification/services/themes/themes.dart';


class Selectedcolor extends StatefulWidget {
  const Selectedcolor({Key? key}) : super(key: key);

  @override
  State<Selectedcolor> createState() => _SelectedcolorState();
}

class _SelectedcolorState extends State<Selectedcolor> {
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.only(top: 15),
            child: Text("Color", style: titleStyle)),
        const SizedBox(height: 8.0),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? pinkClr
                          : yellowClr,
                  child: _selectedColor == index
                      ? const Icon(Icons.done, color: Colors.white, size: 16)
                      : Container(),
                ),
              ),
            );
          }),
        )
      ]),
    );
  }
}
