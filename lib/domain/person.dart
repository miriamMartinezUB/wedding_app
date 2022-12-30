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

   String get displayName=> name + ' '+surnames;

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
