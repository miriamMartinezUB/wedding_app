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
    return Database().getFormById(formId);
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
                initialSelectedValues: initialSelectedValues,
              ),
            )
            .toList());

    return form;
  }
}
