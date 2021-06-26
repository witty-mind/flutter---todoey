import 'package:flutteer_begins/model/task.dart';
import 'package:flutteer_begins/utils/constants.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final List<Task> taskList;

  AddTaskScreen({required this.taskList});

  void createTask(String taskName) {
    taskList.add(Task(taskName: taskName, isDone: false));
  }

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
        color: Color(0xFF757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Add Task",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400)),
              ),
              TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newValue) {
                    newTaskTitle = newValue;
                  }),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: () {
                  createTask(newTaskTitle!);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
                color: kPrimaryColor,
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
        ));
  }
}
