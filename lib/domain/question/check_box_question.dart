import 'package:wedding_jc/domain/question/question.dart';

class CheckBoxQuestion extends Question {
  final List<String>? values;
  final List<String>? initialSelectedValues;

  CheckBoxQuestion({
    required String title,
    required String id,
    this.values,
    this.initialSelectedValues,
    String? subtitle,
    bool mandatory = true,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
        );

  CheckBoxQuestion copyWith({
    List<String>? initialSelectedValues,
    List<String>? values,
  }) =>
      CheckBoxQuestion(
        id: id,
        title: title,
        values: values ?? this.values,
        initialSelectedValues: initialSelectedValues ?? this.initialSelectedValues,
        subtitle: subtitle,
        mandatory: mandatory,
      );
}
