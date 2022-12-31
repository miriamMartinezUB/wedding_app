import 'package:wedding_jc/data/database.dart';
import 'package:wedding_jc/domain/form.dart';
import 'package:wedding_jc/domain/question/index.dart';
import 'package:wedding_jc/domain/task.dart';
import 'package:wedding_jc/resources/diets_menu_allergies_intolerances.dart';
import 'package:wedding_jc/resources/form_ids.dart';
import 'package:wedding_jc/resources/routes.dart';

class DataFiller {
  final Database database;

  DataFiller(this.database);

  fillDatabaseWithData() {
    ///Adding forms

    AppForm addPersonForm = AppForm(
      id: FormIds.personFormId,
      name: 'add_person_form_name',
      questions: [
        FreeTextQuestion(
          title: 'add_person_question_name',
          id: '21758d0a-2a01-4b38-95ba-074957e480df',
        ),
        FreeTextQuestion(
          title: 'add_person_question_surname',
          id: 'e8cf4f93-ecb3-48eb-9169-c3788270bc96',
        ),
        DateQuestion(
          title: 'add_person_question_date_birth',
          id: 'cbfcf4cf-a8d0-4578-988e-8306314e7439',
        ),
      ],
    );

    database.setAddPerson(addPersonForm);

    AppForm addDietAndIntolerancesForm = AppForm(
      id: FormIds.dietAndIntolerancesFormId,
      name: 'add_diet_and_intolerances_form_name',
      isByPerson: true,
      questions: [
        SingleSelectionQuestion(
          values: Diet.values.map((diet) => diet.title).toList(),
          title: 'add_diet_and_intolerances_question_diet',
          initialSelectedValue: Diet.regular.title,
          id: '032ed928-59af-451f-9036-edd670fdda5c',
        ),
        SingleSelectionQuestion(
          values: Menu.values.map((menu) => menu.title).toList(),
          initialSelectedValue: Menu.adult.title,
          title: 'add_diet_and_intolerances_question_menu',
          id: 'd14e8db2-eeed-4eed-814f-40d8c81eb4df',
        ),
        CheckBoxQuestion(
          values: Intolerance.values
              .map((intolerance) => intolerance.title)
              .toList(),
          title: 'add_diet_and_intolerances_question_intolerances',
          id: 'af5819f5-edde-4099-b9d6-8351b786be55',
        ),
        CheckBoxQuestion(
          values: Allergy.values.map((allergy) => allergy.title).toList(),
          title: 'add_diet_and_intolerances_question_allergy',
          id: '0a4a0026-c9bb-42fb-b667-73649f1f0b38',
        ),
        FreeTextQuestion(
          title: 'add_diet_and_intolerances_question_other',
          id: 'c70259b1-9782-48eb-b3b4-e92834ab3c54',
          mandatory: false,
        ),
        FreeTextQuestion(
          title: 'add_diet_and_intolerances_question_observations',
          id: '6a6f5cfb-89e5-4e9f-be2d-68cccd2581da',
          longText: true,
          mandatory: false,
        ),
      ],
    );

    database.setAddDietAndIntolerances(addDietAndIntolerancesForm);

    AppForm interestedBusForm = AppForm(
      id: FormIds.interestedBusFormId,
      name: 'interested_bus_form_name',
      questions: [
        CheckBoxQuestion(
          title: 'interested_bus_form_question_who',
          id: '9483463e-2825-4a90-a301-093ccd47c23f',
        ),
      ],
    );

    database.setInterestedInBus(interestedBusForm);

    AppForm interestedHotelForm = AppForm(
      id: FormIds.interestedHotelFormId,
      name: 'interested_hotel_form_name',
      questions: [
        CheckBoxQuestion(
          title: 'interested_hotel_form_question_who',
          id: '2492b725-0532-4697-afa9-88ca6feb4936',
        ),
      ],
    );

    database.setInterestedInHotel(interestedHotelForm);

    ///Adding tasks
    Task addPeopleTask = TaskPage(
      id: 'ef949cb9-2b25-438c-b36a-08734ebadc04',
      title: 'task_add_people_title',
      subtitle: 'task_add_people_subtitle',
      availableUntil: DateTime(2022, 12, 03),
      routeName: Routes.persons,
    );

    Task addDietAndIntolerancesTask = TaskPage(
      id: '37ae81ee-d2cc-41bb-9007-70b45a5b11f4',
      title: 'task_add_intolerances_title',
      availableUntil: DateTime(2022, 12, 03),
      routeName: Routes.dietAndIntolerances,
    );

    Task addBusInterestedTask = TaskForm(
      id: '1940c194-ae5c-47c1-af23-71f346ce691e',
      formId: FormIds.interestedBusFormId,
      title: 'task_add_bus_interested_title',
      availableUntil: DateTime(2022, 12, 03),
      routeName: Routes.form,
    );

    Task addHotelInterestedTask = TaskForm(
      id: 'b3a6f968-2538-42ca-83a9-0b6358d7ad98',
      formId: FormIds.interestedHotelFormId,
      title: 'task_add_hotel_interested_title',
      availableUntil: DateTime(2022, 12, 03),
      routeName: Routes.form,
    );

    Task subscribePhotosTask = TaskLink(
      id: '21097897-4a55-45a8-a201-80999a17c03a',
      title: 'task_subscribe_photos_title',
      availableUntil: DateTime(2022, 12, 03),
      link: 'https://photos.app.goo.gl/zGTVX4hER9KP1vvv7',
    );

    database.setTasks([
      addPeopleTask,
      addDietAndIntolerancesTask,
      addBusInterestedTask,
      addHotelInterestedTask,
      subscribePhotosTask,
    ]);
  }
}
