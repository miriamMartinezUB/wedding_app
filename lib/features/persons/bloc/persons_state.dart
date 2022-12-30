part of 'persons_bloc.dart';

@immutable
abstract class PersonsState {}

class PersonsInitial extends PersonsState {}

class PersonsLoading extends PersonsState {}

class PersonsLoad extends PersonsState {
  final List<Person> persons;

  PersonsLoad(this.persons);
}
