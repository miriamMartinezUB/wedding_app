class Form {
  final String name;
  final List<Question> questions;

  Form({
    required this.name,
    required this.questions,
  });
}

class Question {
  final String title;
  final String? subtitle;
  final bool mandatory;
  final bool visibility;

  Question({
    required this.title,
    this.subtitle,
    this.mandatory = true,
    this.visibility = true,
  });
}

class DateQuestion extends Question {
  final DateTime date;

  DateQuestion({
    required this.date,
    required String title,
    String? subtitle,
    bool mandatory = true,
    bool visibility = true,
  }) : super(
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
          visibility: visibility,
        );
}

class SingleSelectionQuestion extends Question {
  final List<String> values;
  final String? selectedValue;

  SingleSelectionQuestion({
    required this.values,
    required String title,
    this.selectedValue,
    String? subtitle,
    bool mandatory = true,
    bool visibility = true,
  }) : super(
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
          visibility: visibility,
        );
}

class FreeTextQuestion extends Question {
  final String? hint;
  final String? value;

  FreeTextQuestion({
    required String title,
    this.value,
    this.hint,
    String? subtitle,
    bool mandatory = true,
    bool visibility = true,
  }) : super(
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
          visibility: visibility,
        );
}
