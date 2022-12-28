import 'package:wedding_jc/domain/question/question.dart';

class CheckBoxQuestion extends Question {
  final List<dynamic>? values;
  final dynamic initialSelectedValue;

  CheckBoxQuestion({
    required String title,
    required String id,
    this.values,
    this.initialSelectedValue,
    String? subtitle,
    bool mandatory = true,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
        );

  CheckBoxQuestion copyWith({
    List<dynamic>? values,
    dynamic initialSelectedValue,
  }) =>
      CheckBoxQuestion(
        id: id,
        title: title,
        values: values ?? this.values,
        initialSelectedValue: initialSelectedValue ?? this.initialSelectedValue,
        subtitle: subtitle,
        mandatory: mandatory,
      );
}
