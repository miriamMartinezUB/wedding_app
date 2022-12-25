import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/infrastructure/navigation/navigation_modal.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/routes.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/shadow_card.dart';
import 'package:wedding_jc/views/text.dart';

class ArgsPersonsPage {
  final String appBarName;
  final String? description;

  ArgsPersonsPage({required this.appBarName, this.description});
}

class PersonsPage extends StatelessWidget {
  final String appBarName;
  final String? description;
  const PersonsPage({
    Key? key,
    required this.appBarName,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBarName: appBarName,
      body: Padding(
        padding: const EdgeInsets.all(Dimens.paddingLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description != null) ...[
              AppText(
                description!,
                type: TextTypes.subtitle,
              ),
              const SizedBox(height: Dimens.paddingMedium)
            ],
            CardButton(
              leading: const Icon(Icons.add),
              title: translate('Add person'),
              onTap: () {
                BlocProvider.of<NavigatorBloc>(context)
                    .add(PushScreenNavigationEvent(model: NavigationModel(route: Routes.personaDetail)));
              },
            ),
            const SizedBox(height: Dimens.paddingMedium),
            AppText(
              translate('Edit persons already added'),
              type: TextTypes.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
