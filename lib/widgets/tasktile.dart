import 'package:flutteer_begins/utils/constants.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool? isChecked = false;
  final String? taskTitle;
  final Function? checkBoxCallBack;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      @required this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle!,
        style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          activeColor: kPrimaryColor,
          value: isChecked,
          onChanged: (newValue) {
            checkBoxCallBack!(newValue);
          }),
    );
  }
}
