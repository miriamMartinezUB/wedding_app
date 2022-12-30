import 'package:flutter/cupertino.dart';
import 'package:wedding_jc/data/data_filler.dart';
import 'package:wedding_jc/domain/form.dart';
import 'package:wedding_jc/domain/task.dart';
import 'package:wedding_jc/resources/form_ids.dart';

class Database {
  late AppForm _addPerson;
  late AppForm _addDietAndIntolerances;
  late AppForm _interestedInBus;
  late AppForm _interestedInHotel;
  List<Task> _tasks = [];

  Database() {
    DataFiller(this).fillDatabaseWithData();
  }

  AppForm getFormById(String formId) {
    if (FormIds.personFormId == formId) {
      return _addPerson;
    }
    if (FormIds.dietAndIntolerancesFormId == formId) {
      return _addDietAndIntolerances;
    }
    if (FormIds.interestedBusFormId == formId) {
      return _interestedInBus;
    }
    if (FormIds.interestedHotelFormId == formId) {
      return _interestedInHotel;
    }
    throw FlutterError('Not form for id: $formId');
  }

  setAddPerson(AppForm addPerson) {
    _addPerson = addPerson;
  }

  setAddDietAndIntolerances(AppForm addDietAndIntolerances) {
    _addDietAndIntolerances = addDietAndIntolerances;
  }

  setInterestedInBus(AppForm interestedInBus) {
    _interestedInBus = interestedInBus;
  }

  setInterestedInHotel(AppForm interestedInHotel) {
    _interestedInHotel = interestedInHotel;
  }

  List<Task> get tasks => _tasks;

  setTasks(List<Task> tasks) {
    _tasks = tasks;
  }
}
