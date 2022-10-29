import 'package:wedding_jc/data/database.dart';
import 'package:wedding_jc/domain/task.dart';
import 'package:wedding_jc/resources/routes.dart';

class DataFiller {
  final Database database;

  DataFiller(this.database);

  fillDatabaseWithData() {
    Task addPeople = TaskPage(
      id: 'ef949cb9-2b25-438c-b36a-08734ebadc04',
      title: 'task_add_people_title',
      subtitle: 'task_add_people_subtitle',
      availableUntil: DateTime(2022, 12, 03),
      routeName: Routes.persons,
    );
    Task addIntolerances = TaskPage(
      id: '37ae81ee-d2cc-41bb-9007-70b45a5b11f4',
      title: 'task_add_intolerances_title',
      availableUntil: DateTime(2022, 12, 03),
      routeName: '',
    );

    Task addBusInterested = TaskPage(
      id: '1940c194-ae5c-47c1-af23-71f346ce691e',
      title: 'task_add_bus_interested_title',
      availableUntil: DateTime(2022, 12, 03),
      routeName: '',
    );

    Task subscribePhotos = TaskLink(
      id: '21097897-4a55-45a8-a201-80999a17c03a',
      title: 'task_subscribe_photos_title',
      availableUntil: DateTime(2022, 12, 03),
      link: '',
    );

    database.setTasks([addPeople, addIntolerances, addBusInterested, subscribePhotos]);
  }
}
