part of 'app_form_bloc.dart';

abstract class AppFormState {}

class FormInitial extends AppFormState {}

class FormSaved extends AppFormState {}

class FormLoading extends AppFormState {}

class FormLoaded extends AppFormState {
  final AppForm form;

  FormLoaded({required this.form});
}
