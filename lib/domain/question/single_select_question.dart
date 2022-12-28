import 'package:wedding_jc/domain/question/question.dart';

class SingleSelectionQuestion extends Question {
  final List<dynamic> values;
  final dynamic initialSelectedValue;

  SingleSelectionQuestion({
    required this.values,
    required String title,
    required String id,
    this.initialSelectedValue,
    String? subtitle,
    bool mandatory = true,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
        );

  SingleSelectionQuestion copyWith({
    List<dynamic>? values,
    dynamic initialSelectedValue,
  }) =>
      SingleSelectionQuestion(
        id: id,
        title: title,
        values: values ?? this.values,
        initialSelectedValue: initialSelectedValue ?? this.initialSelectedValue,
        subtitle: subtitle,
        mandatory: mandatory,
      );
}
