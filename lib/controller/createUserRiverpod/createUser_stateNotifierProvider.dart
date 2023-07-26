import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'states.dart';

final creatUserProvider = StateNotifierProvider<CreateUserNotifier, UserStates>(
    (ref) => CreateUserNotifier());

class CreateUserNotifier extends StateNotifier<UserStates> {
  CreateUserNotifier() : super(LoadedStateForuser());

  get loadingState => state = LoadingStateForUser();
  get loadedState => state = LoadedStateForuser();

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String userName,
      required String address}) async {
    final firebaseFirestore =
        FirebaseFirestore.instance.collection('creatUser');

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((value) async {
        await firebaseFirestore.doc(value.user!.uid).set({
          'userName': userName,
          'email': email,
          'password': password,
          'address': address
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
