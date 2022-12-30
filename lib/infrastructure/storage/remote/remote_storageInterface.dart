import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:wedding_jc/infrastructure/firebase/firebase_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';

abstract class RemoteStorageInterface<T> {
  final String _collection;
  RemoteStorageInterface(this._collection);

  @protected
  CollectionReference get collectionRef => locator<FirebaseService>().fireStore.collection(_collection);
  Future<void> add(T t);
  Future<void> update(String id, Map<String, dynamic> fields);
  Future<T> get(String id);
  Future<List<T>> get all;
  Stream<List<T>> get all$;
  Future<void> remove(T t);
}
