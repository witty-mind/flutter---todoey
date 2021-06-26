import 'package:flutteer_begins/model/task.dart';
import 'package:flutteer_begins/utils/constants.dart';
import 'package:flutteer_begins/widgets/taskBottomSheets.dart';
import 'package:flutteer_begins/widgets/tasklist.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

List<Task> tasks = [
  Task(taskName: "Buy Milks", isDone: false),
  Task(taskName: "Buy eggs", isDone: false),
  Task(taskName: "Buy Vegs", isDone: false),
];

class _TaskScreenState extends State<TaskScreen> {
  String getCallBackdata() {
    setState(() {
      print(
          "New Task added. Here is the updated task list length ${tasks.length}");
    });

    return "String";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => AddTaskScreen(
                      taskList: tasks,
                    ))
          },
          backgroundColor: kPrimaryColor,
          child: Icon(Icons.add),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 40.0, left: 40.0, right: 20.0, bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list,
                        size: 40.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      kAppName,
                      style: TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '{tasks.length} tasks',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TasksList(
                  tasksList: tasks,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
