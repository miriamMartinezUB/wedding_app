import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/features/summary/summary_observer.dart';
import 'package:wedding_jc/features/summary/summary_service.dart';
import 'package:wedding_jc/resources/dimens.dart';
import 'package:wedding_jc/views/circular_progress.dart';
import 'package:wedding_jc/views/page_wrapper.dart';
import 'package:wedding_jc/views/text.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SummaryObserver observer = SummaryObserver();
    return PageWrapper(
      appBarName: translate('summary'),
      showDrawer: true,
      body: StreamBuilder<List<Person>>(
        stream: observer.persons$,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgress();
          }
          List<Person> persons = snapshot.data!;
          final SummaryService service = SummaryService(persons);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.paddingXLarge,
                horizontal: Dimens.paddingLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.paddingLarge),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              translate('bus'),
                              type: TextTypes.bodyBold,
                            ),
                            const SizedBox(height: Dimens.paddingS),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
                              child: AppText(
                                '${translate('total')}: ${service.totalBusPeople}',
                                type: TextTypes.tinyBody,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: Dimens.paddingS),
                              child: Divider(),
                            ),
                            AppText(
                              translate('hotel'),
                              type: TextTypes.bodyBold,
                            ),
                            const SizedBox(height: Dimens.paddingS),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
                              child: AppText(
                                '${translate('total')}: ${service.totalHotelPeople}',
                                type: TextTypes.tinyBody,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: Dimens.paddingS),
                              child: Divider(),
                            ),
                            AppText(
                              translate('add_diet_and_intolerances_question_menu'),
                              type: TextTypes.bodyBold,
                            ),
                            const SizedBox(height: Dimens.paddingS),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
                              child: AppText(
                                service.summaryMenu,
                                type: TextTypes.tinyBody,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: Dimens.paddingS),
                              child: Divider(),
                            ),
                            AppText(
                              translate('add_diet_and_intolerances_question_diet'),
                              type: TextTypes.bodyBold,
                            ),
                            const SizedBox(height: Dimens.paddingS),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingLarge),
                              child: AppText(
                                service.summaryDiet,
                                type: TextTypes.tinyBody,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Dimens.paddingLarge),
                  AppText(
                    translate('persons_added'),
                    type: TextTypes.titleBold,
                  ),
                  const SizedBox(height: Dimens.paddingLarge),
                  Card(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(Dimens.paddingLarge),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: service.summaryPersons.length,
                      itemBuilder: (context, index) {
                        String namePerson = service.summaryPersons[index].first;
                        String descriptionPerson = service.summaryPersons[index].last;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              namePerson,
                              type: TextTypes.bodyBold,
                            ),
                            const SizedBox(height: Dimens.paddingS),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingS),
                              child: AppText(
                                descriptionPerson,
                                type: TextTypes.tinyBody,
                              ),
                            ),
                            if (index != service.summaryPersons.length - 1)
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: Dimens.paddingS),
                                child: Divider(),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
