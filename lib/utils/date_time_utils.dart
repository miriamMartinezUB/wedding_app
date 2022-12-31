import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get formatDate {
    final inputFormat = DateFormat('yyyy-MM-dd');
    DateTime time = inputFormat.parse(toString());
    return '${time.year}/${time.month}/${time.day}';
  }
}
