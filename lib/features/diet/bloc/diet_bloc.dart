import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/infrastructure/storage/remote/person_storage.dart';

part 'diet_event.dart';
part 'diet_state.dart';

class DietBloc extends Bloc<DietEvent, DietState> {
  final PersonStorage _storage = PersonStorage();
  DietBloc() : super(DietInitial()) {
    on<DietLoadEvent>((event, emit) async {
      emit(DietLoading());
      List<Person> persons = await _storage.all;
      emit(DietLoad(persons));
    });
  }
}
