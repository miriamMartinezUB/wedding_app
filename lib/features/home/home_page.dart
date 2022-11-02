import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/domain/task.dart';
import 'package:wedding_jc/features/home/bloc/home_bloc.dart';
import 'package:wedding_jc/features/home/views/header.dart';
import 'package:wedding_jc/features/persons/pages/persons.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_bloc.dart';
import 'package:wedding_jc/infrastructure/navigation/bloc/navigation_event.dart';
import 'package:wedding_jc/infrastructure/navigation/navigation_modal.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/check.dart';
import 'package:wedding_jc/views/shadow_card.dart';
import 'package:wedding_jc/views/spinner.dart';
import 'package:wedding_jc/views/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => HomeBloc(),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingState) {
                BlocProvider.of<HomeBloc>(context).add(HomeInitEvent());
                return const Spinner(); //Add loader
              }
              state as HomeLoadState;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      title: translate('app_name'),
                      subtitle: translate('app_description'),
                    ),
                    const SizedBox(
                      height: Dimens.paddingLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
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
                          child: Row(
                            children: [
                              Check(
                                key: Key(task.id),
                                show: state.doneTasksIds.contains(task.id),
                              ),
                              Expanded(
                                child: CardButton(
                                  title: task.title,
                                  subtitle: task.subtitle,
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    if (task is TaskLink) {
                                      BlocProvider.of<HomeBloc>(context).add(HomeDoneTaskEvent(taskId: task.id));
                                    } else if (task is TaskPage) {
                                      BlocProvider.of<NavigatorBloc>(context).add(
                                        PushScreenNavigationEvent(
                                          model: NavigationModel(
                                            route: task.routeName,
                                            arguments: ArgsPersonsPage(
                                              appBarName: translate(task.title),
                                              description: task.subtitle == null ? null : translate(task.subtitle!),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
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
