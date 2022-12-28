import 'package:wedding_jc/domain/question/question.dart';

class DateQuestion extends Question {
  final DateTime? date;

  DateQuestion({
    this.date,
    required String title,
    required String id,
    String? subtitle,
    bool mandatory = true,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
          mandatory: mandatory,
        );

  DateQuestion copyWith({DateTime? date}) => DateQuestion(
        id: id,
        title: title,
        date: date,
        subtitle: subtitle,
        mandatory: mandatory,
      );
}
