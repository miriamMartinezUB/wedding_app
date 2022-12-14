import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/features/diet/bloc/diet_bloc.dart';
import 'package:wedding_jc/features/form/form_builder_page.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/infrastructure/navigation/navigation_modal.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/form_ids.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/resources/routes.dart';
import 'package:wedding_jc/views/circular_progress.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/shadow_card.dart';
import 'package:wedding_jc/views/text.dart';

class DietPage extends StatelessWidget {
  const DietPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DietBloc bloc = DietBloc();
    final NavigatorBloc navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    return PageWrapper(
      showBackButton: true,
      appBarName: translate('task_add_intolerances_title'),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<DietBloc, DietState>(
          builder: (context, state) {
            if (state is DietInitial) {
              bloc.add(DietLoadEvent());
            }
            if (state is DietLoad) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.paddingXLarge,
                    horizontal: Dimens.paddingLarge,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        translate('add_diet_and_intolerances_form_name'),
                        type: TextTypes.subtitle,
                      ),
                      const SizedBox(height: Dimens.paddingLarge),
                      ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: state.persons.length,
                          itemBuilder: (context, index) {
                            Person person = state.persons[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: person == state.persons.last ? 0 : Dimens.paddingLarge),
                              child: CardButton(
                                key: Key(person.id),
                                title: ('${person.name} ${person.surnames}'),
                                subtitle: person.allergiesAndIntolerances,
                                trailing: const Icon(Icons.edit, color: PaletteColors.icons),
                                onTap: () {
                                  navigatorBloc.add(
                                    PushScreenNavigationEvent(
                                      model: NavigationModel(
                                        route: Routes.form,
                                        arguments: ArgsFormBuilderPage(
                                          formId: FormIds.dietAndIntolerancesFormId,
                                          personId: person.id,
                                          onSave: () {
                                            bloc.add(DietLoadEvent());
                                            navigatorBloc.add(BackNavigationEvent());
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              );
            }
            return const CircularProgress();
          },
        ),
      ),
    );
  }
}
