import 'package:wedding_jc/domain/question/question.dart';

class SingleSelectionQuestion extends Question {
  final List<String> values;
  final String initialSelectedValue;

  SingleSelectionQuestion({
    required this.values,
    required String title,
    required String id,
    required this.initialSelectedValue,
    String? subtitle,
    bool mandatory = true,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
        );

  SingleSelectionQuestion copyWith({
    String? initialSelectedValue,
  }) =>
      SingleSelectionQuestion(
        id: id,
        title: title,
        values: values,
        initialSelectedValue: initialSelectedValue ?? this.initialSelectedValue,
        subtitle: subtitle,
        mandatory: mandatory,
      );
}
