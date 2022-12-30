import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:wedding_jc/resources/dates.dart';
import 'package:wedding_jc/views/text.dart';

class CountDown extends StatelessWidget {
  final Duration duration;

  const CountDown._({Key? key, required this.duration}) : super(key: key);

  factory CountDown.wedding({Key? key, TextStyle? style}) {
    return CountDown._(
      key: key,
      duration: Dates.weedingDate.difference(DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Duration duration = Dates.weedingDate.difference(DateTime.now());
    return SlideCountdown(
      decoration: const BoxDecoration(color: Colors.transparent),
      textStyle: getTextStyle(type: TextTypes.body),
      duration: duration,
    );
  }
}
