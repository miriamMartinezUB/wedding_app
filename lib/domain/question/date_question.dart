import 'package:wedding_jc/domain/question/question.dart';

class DateQuestion extends Question {
  final String? date;

  DateQuestion({
    required String title,
    required String id,
    this.date,
    String? subtitle,
    bool mandatory = true,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
        );

  DateQuestion copyWith({String? date}) => DateQuestion(
        id: id,
        title: title,
        date: date ?? this.date,
        subtitle: subtitle,
        mandatory: mandatory,
      );
}
