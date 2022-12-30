part of 'app_form_bloc.dart';

abstract class AppFormEvent {}

class SaveFormEvent extends AppFormEvent {}

class LoadFormEvent extends AppFormEvent {
  final String? personId;
  final bool addValues;
  LoadFormEvent({this.addValues = false, this.personId});
}

class EditQuestionFormEvent extends AppFormEvent {
  final String questionId;
  final String value;

  EditQuestionFormEvent({
    required this.questionId,
    required this.value,
  });
}
