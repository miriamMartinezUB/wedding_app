import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/infrastructure/language/language_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/page_wrapper.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String languageCode = locator<LanguageService>().currentLanguageCode;
    return PageWrapper(
      backgroundColor: PaletteColors.background,
      appBarName: translate('invitation'),
      showDrawer: true,
      body: Center(
        child: Image.asset(
          'assets/images/invitation_$languageCode.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
