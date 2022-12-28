import 'package:wedding_jc/domain/question/question.dart';

class AppForm {
  final String id;
  final String name;
  final List<Question>? questions;
  final List<Question>? questionsByPerson;

  AppForm({
    required this.id,
    required this.name,
    this.questions,
    this.questionsByPerson,
  }) : assert(questions != null || questionsByPerson != null);

  AppForm copyWith({List<Question>? questions}) => AppForm(
        id: id,
        name: name,
        questions: questions ?? this.questions,
      );
}
