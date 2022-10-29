import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/app_button.dart';
import 'package:wedding_jc/views/text.dart';

class UpdateReadyPage extends StatelessWidget {
  const UpdateReadyPage({Key? key}) : super(key: key);

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
                  translate('update_ready'),
                  type: TextTypes.body,
                  align: TextAlign.center,
                ),
                const SizedBox(height: Dimens.paddingXLarge),
                Image.asset(
                  'assets/animated_gifs/happiness.gif',
                  height: 200,
                ),
                const SizedBox(height: Dimens.paddingXLarge),
                AppText(
                  translate('update_ready_text'),
                  type: TextTypes.body,
                  align: TextAlign.center,
                ),
                const SizedBox(height: Dimens.paddingXLarge),
                AppButton(
                  text: 'update_button',
                  onTap: () async {
                    await launchUrl(
                      Uri.parse('https://flutter.dev'),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
