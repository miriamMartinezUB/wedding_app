import 'package:wedding_jc/resources/diets_menu_allergies_intolerances.dart';

class Person {
  final String id;
  final String name;
  final String surnames;
  final DateTime birthday;
  final String? addedBy;
  final List<String>? intolerances;
  final List<String>? allergies;
  final Menu? typeMenu;
  final Diet? typeDiet;
  final bool? busOneWay;
  final bool? busReturn;

  Person({
    required this.id,
    required this.name,
    required this.surnames,
    required this.birthday,
    this.addedBy,
    this.intolerances,
    this.allergies,
    this.typeMenu,
    this.typeDiet,
    this.busOneWay,
    this.busReturn,
  });
}
