import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get formatDate {
    final inputFormat = DateFormat.yMMMMd('en_US');
    return inputFormat.parse(toString()).toString();
  }
}
