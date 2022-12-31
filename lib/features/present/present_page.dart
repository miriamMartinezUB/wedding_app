import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/features/information/views/app_list_tile.dart';
import 'package:wedding_jc/features/information/views/card_with_image_and_description.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/text.dart';

class PresentPage extends StatelessWidget {
  const PresentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageWrapper(
      appBarName: translate(
          'bank_account_title'), // TODO: Not sure if this is the correct copy for the app bar
      showDrawer: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.paddingXLarge,
          horizontal: Dimens.paddingLarge,
        ),
        child: Column(
          children: [
            AppText(translate('bank_account_title'), type: TextTypes.titleBold),
            const SizedBox(height: Dimens.paddingLarge),
            // TODO: FYI this component is still under information directory
            CardWithImageAndDescription(
              descriptions: [
                // TODO: FYI this component is still under information directory
                AppListTile(
                  text: 'ES53 0049 4174 0121 1408 4349',
                  iconData: Icons.copy,
                  onTap: () async {
                    await Clipboard.setData(
                      const ClipboardData(
                          text: "ES53 0049 4174 0121 1408 4349"),
                    );
                  },
                ),
                AppListTile(
                  text: translate('bank_account_description'),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
