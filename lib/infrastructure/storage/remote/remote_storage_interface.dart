import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:wedding_jc/domain/app_user.dart';
import 'package:wedding_jc/infrastructure/firebase/firebase_service.dart';
import 'package:wedding_jc/infrastructure/locator_setup.dart';
import 'package:wedding_jc/infrastructure/storage/locale_storage_service.dart';
import 'package:wedding_jc/resources/storage_keys.dart';

abstract class RemoteStorageInterface<T> {
  final String _collection;
  RemoteStorageInterface(this._collection);

  @protected
  CollectionReference get collectionRef => locator<FirebaseService>().fireStore.collection(_collection);
  @protected
  String get userId => AppUser.fromJson(
        jsonDecode(
          locator<LocaleStorageService>().getString(StorageKeys.keyUser),
        ),
      ).id;
  Future<void> add(T t);
  Future<void> update(T t);
  Future<T> get(String id);
  Future<List<T>> get all;
  Stream<List<T>> get all$;
  Future<void> remove(T t);
}
