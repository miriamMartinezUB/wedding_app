import 'package:flutter/material.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class QuestionFreeText extends StatefulWidget {
  final String? initialText;
  final Function(String) onChanged;
  final bool isLong;

  const QuestionFreeText({
    Key? key,
    this.initialText,
    required this.onChanged,
    this.isLong = false,
  }) : super(key: key);

  @override
  State<QuestionFreeText> createState() => _QuestionFreeTextState();
}

class _QuestionFreeTextState extends State<QuestionFreeText> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = getTextStyle();
    return TextField(
      controller: _controller,
      style: style,
      maxLines: widget.isLong ? 5 : 1,
      cursorColor: PaletteColors.primary,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          width: 2,
          color: PaletteColors.primary,
        )),
        border: OutlineInputBorder(),
      ),
      onChanged: widget.onChanged,
    );
  }
}
