class FormAnswer {
  final String formId;
  final List<Answer> answers;

  FormAnswer({
    required this.formId,
    required this.answers,
  });
}

class Answer {
  final dynamic value;
  final List<dynamic>? values;
  final String questionId;
  final String personId;

  Answer({
    this.value,
    this.values,
    required this.questionId,
    required this.personId,
  }) : assert(value != null || values != null);
}
