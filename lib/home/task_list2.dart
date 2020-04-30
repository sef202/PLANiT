import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:planit_sprint2/model/task_model.dart';

class TaskTile extends StatelessWidget {

  final Task task;
  TaskTile({this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.grey,
          ),
          title: Text(task.taskName),
          subtitle: Text(task.description),
        ),
      ),
    );
  }
}
