import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class QuestionSingleSelect extends StatelessWidget {
  final List<String> values;
  final String initialValue;
  final Function(String value) onChange;

  const QuestionSingleSelect({
    Key? key,
    required this.values,
    required this.initialValue,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int group = values.indexOf(initialValue);
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: values.length,
      itemBuilder: (context, index) {
        String value = values[index];
        return Row(
          children: [
            Radio(
              fillColor: MaterialStateProperty.all(PaletteColors.primary),
              value: index,
              groupValue: group,
              onChanged: (index) {
                onChange(value);
              },
            ),
            Expanded(
              child: AppText(
                translate(value),
                type: TextTypes.smallBody,
              ),
            ),
          ],
        );
      },
    );
  }
}
