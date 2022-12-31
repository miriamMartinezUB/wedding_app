import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding_jc/data/database.dart';
import 'package:wedding_jc/domain/form.dart';
import 'package:wedding_jc/domain/person.dart';
import 'package:wedding_jc/domain/question/index.dart';
import 'package:wedding_jc/infrastructure/storage/remote/remote_storage_interface.dart';
import 'package:wedding_jc/resources/form_ids.dart';

class PersonStorage extends RemoteStorageInterface<Person> {
  PersonStorage() : super('person');

  @override
  Future<void> add(Person t) async {
    try {
      bool notExist = (await all).where((element) => element.id == t.id).toList().isEmpty;
      if (notExist) {
        if (t.addedBy == null) {
          await collectionRef.doc(t.id).set(t.copyWith(addedBy: userId).toJson());
        } else {
          await collectionRef.doc(t.id).set(t.toJson());
        }
        log('Persona added');
      }
      log('Persona already added');
    } catch (e) {
      log('Persona fail when try to add');
      log(e.toString());
    }
  }

  @override
  Future<Person> get(String id) async {
    final DocumentSnapshot snapshot = await collectionRef.doc(id).get();
    return Person.fromDoc(snapshot);
  }

  @override
  Future<List<Person>> get all async {
    final snapshot = await collectionRef.snapshots().first;
    final List<QueryDocumentSnapshot> docs = snapshot.docs.where((element) => element['addedBy'] == userId).toList();
    List<Person> persons = [];
    for (final QueryDocumentSnapshot doc in docs) {
      persons.add(Person.fromDoc(doc));
    }
    return persons;
  }

  @override
  Future<void> remove(Person t) async {
    await collectionRef.doc(t.id).delete();
  }

  @override
  Stream<List<Person>> get all$ => collectionRef.snapshots().distinct().map(
        (event) {
          List<Person> persons = [];
          final List<QueryDocumentSnapshot> docs = event.docs.where((element) => element['addedBy'] == userId).toList();
          for (final QueryDocumentSnapshot doc in docs) {
            persons.add(Person.fromDoc(doc));
          }
          return persons;
        },
      );

  @override
  Future<void> update(Person t) async {
    DocumentReference doc = collectionRef.doc(t.id);
    try {
      await doc.update(t.toJson());
      log('Persona updated');
    } catch (e) {
      log('Persona fail when try to update');
      log(e.toString());
    }
  }

  Future<AppForm> getFormFromIdAndPersonaId(String formId, String? personaId, {bool addValues = false}) async {
    if (formId == FormIds.personFormId) {
      return await getFormPersona(personaId);
    }
    if (addValues) {
      return await getFormWithAddValues(formId);
    }
    return getFormIntolerances(personaId);
  }

  Future<AppForm> getFormPersona(String? personaId) async {
    AppForm form = Database().getFormById(FormIds.personFormId);
    if (personaId == null) {
      return form;
    }
    Person person = await get(personaId);
    List<Question> questions = [];
    for (Question question in form.questions) {
      if (question.id == '21758d0a-2a01-4b38-95ba-074957e480df') {
        questions.add((question as FreeTextQuestion).copyWith(value: person.name));
      }
      if (question.id == 'e8cf4f93-ecb3-48eb-9169-c3788270bc96') {
        questions.add((question as FreeTextQuestion).copyWith(value: person.surnames));
      }
      if (question.id == 'cbfcf4cf-a8d0-4578-988e-8306314e7439') {
        questions.add((question as DateQuestion).copyWith(date: person.birthday));
      }
    }
    return form.copyWith(questions: questions);
  }

  Future<AppForm> getFormIntolerances(String? personaId) async {
    AppForm form = Database().getFormById(FormIds.dietAndIntolerancesFormId);
    if (personaId == null) {
      return form;
    }
    Person person = await get(personaId);
    List<Question> questions = [];
    for (Question question in form.questions) {
      if (question.id == 'd14e8db2-eeed-4eed-814f-40d8c81eb4df') {
        questions.add((question as SingleSelectionQuestion).copyWith(selectedValue: person.typeMenu));
      }
      if (question.id == '032ed928-59af-451f-9036-edd670fdda5c') {
        questions.add((question as SingleSelectionQuestion).copyWith(selectedValue: person.typeDiet));
      }
      if (question.id == 'af5819f5-edde-4099-b9d6-8351b786be55') {
        questions.add((question as CheckBoxQuestion).copyWith(selectedValues: person.intolerances));
      }
      if (question.id == '0a4a0026-c9bb-42fb-b667-73649f1f0b38') {
        questions.add((question as CheckBoxQuestion).copyWith(selectedValues: person.allergies));
      }
      if (question.id == 'c70259b1-9782-48eb-b3b4-e92834ab3c54') {
        questions.add((question as FreeTextQuestion).copyWith(value: person.otherAllergiesAndIntolerances));
      }
      if (question.id == '6a6f5cfb-89e5-4e9f-be2d-68cccd2581da') {
        questions.add((question as FreeTextQuestion).copyWith(value: person.observations));
      }
    }
    return form.copyWith(questions: questions);
  }

  Future<AppForm> getFormWithAddValues(String formId) async {
    AppForm form = Database().getFormById(formId);
    List<Person> persons = await all;
    List<String> values = persons.map((e) => e.displayName).toList();
    List<String> initialSelectedValues = [];
    if (formId == FormIds.interestedBusFormId) {
      initialSelectedValues =
          persons.where((element) => element.bus != null && element.bus!).map((e) => e.displayName).toList();
    } else if (formId == FormIds.interestedHotelFormId) {
      initialSelectedValues =
          persons.where((element) => element.hotel != null && element.hotel!).map((e) => e.displayName).toList();
    }
    form = form.copyWith(
        questions: form.questions
            .map(
              (question) => (question as CheckBoxQuestion).copyWith(
                values: values,
                selectedValues: initialSelectedValues,
              ),
            )
            .toList());

    return form;
  }
}
