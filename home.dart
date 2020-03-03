import 'package:flutter/material.dart';
import 'task.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home Page'),),     floatingActionButton: FloatingActionButton(
    onPressed: task,
    tooltip: 'Increment',
    child: Icon(Icons.add),
    ),
    );
  }
}