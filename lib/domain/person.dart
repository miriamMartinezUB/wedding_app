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

enum Intolerance { gluten, lactose, fructose, sucrose, sulfites, histamine }

enum Allergy { seafood, fish, anisakis, nuts, pulses }

enum Menu { infant, adult }

enum Diet { omnivore, vegan, vegetarian }
