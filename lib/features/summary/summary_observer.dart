import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/infrastructure/storage/remote/person_storage.dart';

class SummaryObserver {
  final PersonStorage _personStorage = PersonStorage();

  Stream<List<Person>> get persons$ => _personStorage.allWithoutFilters$.distinct().map((persons) => persons);
}
