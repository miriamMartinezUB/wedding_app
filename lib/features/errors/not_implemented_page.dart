import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/count_down.dart';
import 'package:wedding_jc/views/text.dart';

class NotImplementedPage extends StatelessWidget {
  const NotImplementedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.paddingXLarge),
            child: Column(
              children: [
                AppText(
                  translate('welcome'),
                  type: TextTypes.titleMedium,
                  align: TextAlign.center,
                ),
                const SizedBox(height: Dimens.paddingXLarge),
                AppText(
                  translate('app_description'),
                  type: TextTypes.body,
                  align: TextAlign.center,
                ),
                const SizedBox(height: Dimens.paddingXLarge),
                AppText(
                  translate('wedding_time_remaining'),
                  type: TextTypes.body,
                  align: TextAlign.center,
                ),
                const SizedBox(height: Dimens.paddingLarge),
                CountDown.wedding(),
                const SizedBox(height: Dimens.paddingXLarge),
                AppText(
                  translate('app_introduction'),
                  type: TextTypes.body,
                  align: TextAlign.center,
                ),
                const SizedBox(height: Dimens.paddingXLarge),
                AppText(
                  translate('errors_not_implemented_app_text'),
                  type: TextTypes.body,
                  align: TextAlign.center,
                ),
                const SizedBox(height: Dimens.paddingMedium),
                Image.asset(
                  'assets/animated_gifs/settings.gif',
                  height: 85,
                  width: 85,
                ),
                const SizedBox(height: Dimens.paddingMedium),
                AppText(
                  translate('errors_not_implemented_app_good_bye'),
                  type: TextTypes.body,
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
