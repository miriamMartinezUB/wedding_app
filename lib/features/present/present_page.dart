import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/features/information/views/app_list_tile.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/text.dart';

class PresentPage extends StatelessWidget {
  const PresentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageWrapper(
      appBarName: translate('bank_account_title'),
      showDrawer: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.paddingXLarge,
          horizontal: Dimens.paddingLarge,
        ),
        child: Column(
          children: [
            AppText(translate('bank_account_description')),
            const SizedBox(height: Dimens.paddingLarge),
            AppListTile(
              text: 'ES54 2100 0834 5501 0334 5473',
              iconData: Icons.copy,
              onTap: () async {
                await Clipboard.setData(
                  const ClipboardData(text: "ES54 2100 0834 5501 0334 5473"),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
