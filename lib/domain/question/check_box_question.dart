import 'package:wedding_jc/domain/question/question.dart';

class CheckBoxQuestion extends Question {
  final List<String>? values;
  final List<String>? selectedValues;

  CheckBoxQuestion({
    required String title,
    required String id,
    this.values,
    this.selectedValues,
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
        selectedValues: initialSelectedValues ?? this.selectedValues,
        subtitle: subtitle,
        mandatory: mandatory,
      );
}
