import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Person {
  final String id;
  final String name;
  final String surnames;
  final String? birthday;
  final String? addedBy;
  final List? intolerances;
  final List? allergies;
  final String? typeMenu;
  final String? typeDiet;
  final bool? bus;
  final bool? hotel;
  final String? otherAllergiesAndIntolerances;
  final String? observations;
  final String? languageCode;

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
    this.observations,
    this.otherAllergiesAndIntolerances,
    this.languageCode,
  });

  String get displayName => '$name $surnames';
  String? get allergiesAndIntolerances {
    String s = typeMenu == null || typeMenu == ''
        ? ''
        : '[${translate('add_diet_and_intolerances_question_menu')}:](B) ${translate(typeMenu!)}';
    s = typeDiet == null || typeDiet == ''
        ? s
        : '$s\n[${translate('add_diet_and_intolerances_question_diet')}:](B) ${translate(typeDiet!)}';
    if (intolerances != null && intolerances!.isNotEmpty) {
      s = '$s\n[${translate('add_diet_and_intolerances_question_intolerances')}:](B)';
      for (String intolerance in intolerances!) {
        s = '$s   ${translate(intolerance)}';
        if (intolerance != intolerances!.last) {
          s = '$s,';
        }
      }
    }
    if (allergies != null && allergies!.isNotEmpty) {
      s = '$s\n[${translate('add_diet_and_intolerances_question_allergy')}:](B)';
      for (String allergy in allergies!) {
        s = '$s ${translate(allergy)}';
        if (allergy != allergies!.last) {
          s = '$s,';
        }
      }
    }
    s = otherAllergiesAndIntolerances == null || otherAllergiesAndIntolerances == ''
        ? s
        : '$s\n[${translate('add_diet_and_intolerances_question_other')}:](B) ${translate(otherAllergiesAndIntolerances!)}';
    s = observations == null || observations == ''
        ? s
        : '$s\n[${translate('add_diet_and_intolerances_question_observations')}:](B) ${translate(observations!)}';
    return s == '' ? null : s;
  }

  Person copyWith({
    String? name,
    String? surnames,
    String? birthday,
    List? intolerances,
    List? allergies,
    String? typeMenu,
    String? typeDiet,
    String? addedBy,
    bool? bus,
    bool? hotel,
    String? otherAllergiesAndIntolerances,
    String? observations,
    String? languageCode,
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
      languageCode: languageCode ?? languageCode,
      observations: observations ?? observations,
      otherAllergiesAndIntolerances: otherAllergiesAndIntolerances ?? this.otherAllergiesAndIntolerances,
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
      observations: doc['observations'],
      otherAllergiesAndIntolerances: doc['otherAllergiesAndIntolerances'],
      languageCode: doc['languageCode'],
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
      'observations': observations,
      'otherAllergiesAndIntolerances': otherAllergiesAndIntolerances,
      'languageCode': languageCode,
    };
  }
}
