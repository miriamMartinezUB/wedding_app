import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  final String id;
  final String name;
  final String surnames;
  final String? birthday;
  final String? addedBy;
  final List<String>? intolerances;
  final List<String>? allergies;
  final String? typeMenu;
  final String? typeDiet;
  final bool? bus;
  final bool? hotel;

  Person({
    required this.id,
    required this.name,
    required this.surnames,
    this.birthday,
    this.addedBy,
    this.intolerances,
    this.allergies,
    this.typeMenu,
    this.typeDiet,
    this.bus,
    this.hotel,
  });

  String get displayName => '$name $surnames';

  Person copyWith({
    String? name,
    String? surnames,
    String? birthday,
    List<String>? intolerances,
    List<String>? allergies,
    String? typeMenu,
    String? typeDiet,
    String? addedBy,
    bool? bus,
    bool? hotel,
  }) {
    return Person(
      id: id,
      name: name ?? this.name,
      surnames: surnames ?? this.surnames,
      hotel: hotel ?? this.hotel,
      bus: bus ?? this.bus,
      birthday: birthday ?? this.birthday,
      allergies: allergies ?? this.allergies,
      intolerances: intolerances ?? this.intolerances,
      typeDiet: typeDiet ?? this.typeDiet,
      typeMenu: typeMenu ?? this.typeMenu,
      addedBy: addedBy ?? this.addedBy,
    );
  }

  factory Person.fromDoc(DocumentSnapshot doc) {
    return Person(
      id: doc['id'],
      name: doc['name'],
      surnames: doc['surnames'],
      birthday: doc['birthday'],
      addedBy: doc['addedBy'],
      allergies: doc['allergies'],
      bus: doc['bus'],
      hotel: doc['hotel'],
      intolerances: doc['intolerances'],
      typeDiet: doc['typeDiet'],
      typeMenu: doc['typeMenu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surnames': surnames,
      'birthday': birthday,
      'addedBy': addedBy,
      'allergies': allergies,
      'bus': bus,
      'hotel': hotel,
      'intolerances': intolerances,
      'typeDiet': typeDiet,
      'typeMenu': typeMenu,
    };
  }
}
