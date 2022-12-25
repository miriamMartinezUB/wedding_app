import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_jc/data/database.dart';
import 'package:wedding_jc/domain/task.dart';
import 'package:wedding_jc/features/home/home_storage.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Database _database = Database();
  final HomeStorage _storage = HomeStorage();

  HomeBloc() : super(HomeLoadingState()) {
    on<HomeInitEvent>((event, emit) async {
      List<String> doneTasksIds = await _storage.tasksDone;
      emit(HomeLoadState(
        tasks: _database.tasks,
        doneTasksIds: doneTasksIds,
      ));
    });
    on<HomeDoneTaskEvent>((event, emit) async {
      await _storage.markTaskAsDone(taskId: event.taskId);
      List<String> doneTasksIds = await _storage.tasksDone;
      emit(HomeLoadState(
        tasks: _database.tasks,
        doneTasksIds: doneTasksIds,
      ));
    });
    on<HomeLaunchLinkEvent>((event, emit) async {
      try {
        launchUrlString(event.link);
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
