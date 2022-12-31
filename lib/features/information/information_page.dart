import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wedding_jc/features/information/views/app_list_tile.dart';
import 'package:wedding_jc/features/information/views/card_with_image_and_description.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/text.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWrapper(
        appBarName: translate('information'),
        showDrawer: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Dimens.paddingXLarge,
              horizontal: Dimens.paddingLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(translate('place_title'), type: TextTypes.titleBold),
                const SizedBox(height: Dimens.paddingLarge),
                CardWithImageAndDescription(
                  imagePath: 'assets/images/torre_del_pi.jpeg',
                  descriptions: [
                    AppListTile(
                      text: translate('place_name'),
                      isTitle: true,
                    ),
                    AppListTile(
                      text: translate('place_direction'),
                      iconData: Icons.location_on,
                      onTap: () {
                        launchUrlString(
                            'https://goo.gl/maps/gxQGEEP849W6vgRy5');
                      },
                    ),
                    AppListTile(
                      text: translate('662 63 04 38'),
                      iconData: Icons.phone,
                      onTap: () {
                        launchUrlString('tel://662630438');
                      },
                    ),
                    AppListTile(
                      text: translate('place_description'),
                    ),
                  ],
                ),
                const SizedBox(height: Dimens.paddingXLarge),
                AppText(translate('hotel_recommendation_title'),
                    type: TextTypes.titleBold),
                const SizedBox(height: Dimens.paddingLarge),
                CardWithImageAndDescription(
                  imagePath: 'assets/images/hotel_recommendation.jpg',
                  descriptions: [
                    AppListTile(
                      text: translate('hotel_recommendation_name'),
                      isTitle: true,
                    ),
                    AppListTile(
                      text: translate('hotel_recommendation_direction'),
                      iconData: Icons.location_on,
                      onTap: () {
                        launchUrlString(
                            'https://goo.gl/maps/KjgE3Qh8Q2yq7Db98');
                      },
                    ),
                    AppListTile(
                      text: translate('932 22 60 06'),
                      iconData: Icons.phone,
                      onTap: () {
                        launchUrlString('tel://932226006');
                      },
                    ),
                    AppListTile(
                      text: translate('hotel_recommendation_description'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
