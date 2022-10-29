import 'package:shared_preferences/shared_preferences.dart';

class HomeStorage {
  static const String _keyDoneTasks = 'wedding_done_tasks';

  Future<List<String>> get tasksDone async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyDoneTasks) ?? [];
  }

  Future<void> markTaskAsDone({required String taskId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> doneTasksIds = prefs.getStringList(_keyDoneTasks) ?? [];
    doneTasksIds.add(taskId);
    prefs.setStringList(_keyDoneTasks, doneTasksIds);
  }
}
