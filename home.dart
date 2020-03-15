import 'package:flutter/material.dart';
import 'task.dart';
import 'login_screen.dart';
import 'main.dart';

class MenuOptions {
  static const String SignOut = 'Sign out';
  //add more strings here for more menu options

  static const List<String> choices = <String>[
    SignOut
  ];
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: <Widget>[
            PopupMenuButton<String>(   // 3 dot menu button for sign out (add more options later?)
              onSelected: (choice) => choiceAction(choice, context),
              itemBuilder: (BuildContext context) {
                return MenuOptions.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: task,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  //function for menu choices on popup menu button
  void choiceAction(String choice, BuildContext context) {
    if (choice == MenuOptions.SignOut) {
      Navigator.pushReplacementNamed(context, "/logout");
    }
  }
}