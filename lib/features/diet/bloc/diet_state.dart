part of 'diet_bloc.dart';

@immutable
abstract class DietState {}

class DietInitial extends DietState {}

class DietLoading extends DietState {}

class DietLoad extends DietState {
  final List<Person> persons;

  DietLoad(this.persons);
}
