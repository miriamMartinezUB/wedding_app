import 'package:wedding_jc/data/data_filler.dart';
import 'package:wedding_jc/domain/form.dart';
import 'package:wedding_jc/domain/task.dart';

class Database {
  late AppForm _addPerson;
  late AppForm _addDietAndIntolerances;
  late AppForm _interestedInBus;
  late AppForm _interestedInHotel;
  List<Task> _tasks = [];

  Database() {
    DataFiller(this).fillDatabaseWithData();
  }

  AppForm get addPersonsForm => _addPerson;

  setAddPerson(AppForm addPerson) {
    _addPerson = addPerson;
  }

  AppForm get addDietAndIntolerances => _addDietAndIntolerances;

  setAddDietAndIntolerances(AppForm addDietAndIntolerances) {
    _addDietAndIntolerances = addDietAndIntolerances;
  }

  AppForm get interestedInBus => _interestedInBus;

  setInterestedInBus(AppForm interestedInBus) {
    _interestedInBus = interestedInBus;
  }

  AppForm get interestedInHotel => _interestedInHotel;

  setInterestedInHotel(AppForm interestedInHotel) {
    _interestedInHotel = interestedInHotel;
  }

  List<Task> get tasks => _tasks;

  setTasks(List<Task> tasks) {
    _tasks = tasks;
  }
}
