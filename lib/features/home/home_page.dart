import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/domain/task.dart';
import 'package:wedding_jc/features/form/form_builder_page.dart';
import 'package:wedding_jc/features/home/bloc/home_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/infrastructure/navigation/navigation_modal.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/resources/palette_colors.dart';
import 'package:wedding_jc/views/count_down.dart';
import 'package:wedding_jc/views/expand_image_with_blur_background.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/shadow_card.dart';
import 'package:wedding_jc/views/spinner.dart';
import 'package:wedding_jc/views/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBarName: translate('app_name'),
      showDrawer: true,
      canGoHome: false,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeBloc(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
              if (state is HomeLoadingState) {
                homeBloc.add(HomeInitEvent());
                return const Spinner(); //Add loader
              }
              state as HomeLoadState;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const ExpandImageWithBlurBackground(
                        height: 250, imagePath: 'assets/images/judit_and_cristian.jpeg'),
                    Container(
                      color: PaletteColors.primary,
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: Dimens.paddingXLarge,
                          ),
                          AppText(
                            translate('welcome'),
                            type: TextTypes.titleMedium,
                            align: TextAlign.center,
                            // color: PaletteColors.textSubtitle,
                          ),
                          const SizedBox(
                            height: Dimens.paddingLarge,
                          ),
                          AppText(
                            translate('wedding_time_remaining'),
                            type: TextTypes.body,
                            align: TextAlign.center,
                            // color: PaletteColors.textSubtitle,
                          ),
                          const SizedBox(
                            height: Dimens.paddingMedium,
                          ),
                          CountDown.wedding(),
                          const SizedBox(
                            height: Dimens.paddingLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Dimens.paddingLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Dimens.paddingLarge),
                      child: AppText(
                        translate('app_description'),
                        type: TextTypes.body,
                        align: TextAlign.center,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(Dimens.paddingLarge),
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final Task task = state.tasks[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: task == state.tasks.last ? 0 : Dimens.paddingLarge),
                          child: CardButton(
                            title: task.title,
                            subtitle: task.subtitle,
                            trailing: const Icon(Icons.arrow_forward_ios),
                            onTap: () async {
                              if (task is TaskLink) {
                                homeBloc.add(HomeLaunchLinkEvent(link: task.link));
                              } else if (task is TaskPage) {
                                BlocProvider.of<NavigatorBloc>(context).add(
                                  PushScreenNavigationEvent(
                                    model: NavigationModel(
                                      route: task.routeName,
                                    ),
                                  ),
                                );
                              } else if (task is TaskForm) {
                                BlocProvider.of<NavigatorBloc>(context).add(
                                  PushScreenNavigationEvent(
                                    model: NavigationModel(
                                        route: task.routeName,
                                        arguments: ArgsFormBuilderPage(
                                          formId: task.formId,
                                          addValues: true,
                                        )),
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
