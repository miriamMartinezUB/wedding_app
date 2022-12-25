import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/app_button.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/text.dart';

class AddPersonaDetailPage extends StatelessWidget {
  const AddPersonaDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBarName: 'Add person detail',
      canGoHome: true,
      body: FormBuilder(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.paddingXLarge, horizontal: Dimens.paddingLarge),
          child: Column(
            children: [
              FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                name: 'Name',
                cursorColor: PaletteColors.primary,
                style: getTextStyle(),
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: getTextStyle(),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: PaletteColors.primary),
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: Dimens.paddingXLarge,
              ),
              FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                name: 'Surname',
                cursorColor: PaletteColors.primary,
                style: getTextStyle(),
                decoration: InputDecoration(
                  labelText: 'Surname',
                  labelStyle: getTextStyle(),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: PaletteColors.primary),
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: Dimens.paddingXLarge,
              ),
              FormBuilderDateTimePicker(
                name: 'date',
                initialEntryMode: DatePickerEntryMode.calendar,
                inputType: InputType.date,
                style: getTextStyle(),
                cursorColor: PaletteColors.primary,
                decoration: InputDecoration(
                  labelText: 'Birthday date',
                  labelStyle: getTextStyle(),
                  border: const OutlineInputBorder(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: PaletteColors.primary),
                  ),
                ),
              ),
              const SizedBox(
                height: Dimens.paddingXLarge,
              ),
              const AppButton(text: 'Save'),
            ],
          ),
        ),
      ),
    );
  }
}
