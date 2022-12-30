import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/infrastructure/storage/remote/person_storage.dart';

part 'persons_event.dart';
part 'persons_state.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  final PersonStorage _storage = PersonStorage();
  PersonsBloc() : super(PersonsInitial()) {
    on<PersonsLoadEvent>((event, emit) async {
      emit(PersonsLoading());
      List<Person> persons = await _storage.all;
      emit(PersonsLoad(persons));
    });
  }
}
