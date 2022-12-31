import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/text.dart';

class QuestionCheckBox extends StatelessWidget {
  final List<String> values;
  final List valuesSelected;
  final Function(String newValue) onChange;

  const QuestionCheckBox({
    Key? key,
    required this.values,
    required this.valuesSelected,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: values.length,
      itemBuilder: (context, index) {
        String value = values[index];
        return Row(
          children: [
            Checkbox(
              fillColor: MaterialStateProperty.all(PaletteColors.primary),
              value: valuesSelected.contains(value),
              onChanged: (bool? selected) {
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
