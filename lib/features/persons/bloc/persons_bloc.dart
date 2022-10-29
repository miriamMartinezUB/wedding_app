import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'persons_event.dart';
part 'persons_state.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  PersonsBloc() : super(PersonsInitial()) {
    on<PersonsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
