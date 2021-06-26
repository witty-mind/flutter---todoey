import 'package:flutteer_begins/model/task.dart';
import 'package:flutteer_begins/widgets/tasktile.dart';
import 'package:flutter/material.dart';

class TasksList extends StatefulWidget {
  final List<Task>? tasksList;

  TasksList({required this.tasksList});

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.tasksList!.length,
        itemBuilder: (context, index) {
          return TaskTile(
            isChecked: widget.tasksList![index].isDone,
            taskTitle: widget.tasksList![index].taskName,
            checkBoxCallBack: (checkboxState) {
              setState(() {
                widget.tasksList![index].toggleDone();
              });
            },
          );
        });
  }
}
