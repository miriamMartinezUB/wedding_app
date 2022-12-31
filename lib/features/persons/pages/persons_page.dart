import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/features/form/form_builder_page.dart';
import 'package:wedding_jc/features/persons/bloc/persons_bloc.dart';
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

class PersonsPage extends StatelessWidget {
  const PersonsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PersonsBloc bloc = PersonsBloc();
    final NavigatorBloc navigatorBloc = BlocProvider.of<NavigatorBloc>(context);
    return PageWrapper(
      showBackButton: true,
      appBarName: translate('task_add_people_title'),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<PersonsBloc, PersonsState>(
          builder: (context, state) {
            if (state is PersonsInitial) {
              bloc.add(PersonsLoadEvent());
            }
            if (state is PersonsLoad) {
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
                        translate('task_add_people_subtitle'),
                        type: TextTypes.subtitle,
                      ),
                      const SizedBox(height: Dimens.paddingMedium),
                      CardButton(
                        leading: const Icon(Icons.add),
                        title: translate('Add person'),
                        onTap: () {
                          navigatorBloc.add(
                            PushScreenNavigationEvent(
                              model: NavigationModel(
                                route: Routes.form,
                                arguments: ArgsFormBuilderPage(
                                  formId: FormIds.personFormId,
                                  newPerson: true,
                                  onSave: () {
                                    bloc.add(PersonsLoadEvent());
                                    navigatorBloc.add(BackNavigationEvent());
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: Dimens.paddingXLarge),
                      AppText(
                        translate('persons_added'),
                        type: TextTypes.titleMedium,
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
                                title: (person.name + ' ' + person.surnames),
                                subtitle: person.birthday,
                                trailing: const Icon(Icons.edit, color: PaletteColors.icons),
                                onTap: () {
                                  navigatorBloc.add(
                                    PushScreenNavigationEvent(
                                      model: NavigationModel(
                                        route: Routes.form,
                                        arguments: ArgsFormBuilderPage(
                                          formId: FormIds.personFormId,
                                          personId: person.id,
                                          onSave: () {
                                            bloc.add(PersonsLoadEvent());
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
