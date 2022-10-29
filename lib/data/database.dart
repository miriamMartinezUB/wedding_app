import 'package:wedding_jc/data/data_filler.dart';
import 'package:wedding_jc/domain/task.dart';

class Database {
  List<Task> tasks = [];

  Database() {
    DataFiller(this).fillDatabaseWithData();
  }

  setTasks(List<Task> tasks) {
    this.tasks = tasks;
  }
}
