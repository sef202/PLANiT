import 'package:flutter/cupertino.dart';
import 'task_model.dart';
import 'package:planit_sprint2/services/database.dart';

class CurrentTask extends ChangeNotifier {
  Task _currentTask = Task();
  Task get getCurrentTask => _currentTask;

  void updateStateFromDatabase(String taskName) async {
    try {
      _currentTask = await DatabaseService().getCurrentTask(taskName);
      notifyListeners();
    } catch(e) {
      print(e);
    }
  }
}