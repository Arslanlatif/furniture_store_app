import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'states.dart';

final signInUserProvider =
    StateNotifierProvider<SignInUserNotifier, UserStates>(
        (ref) => SignInUserNotifier());

class SignInUserNotifier extends StateNotifier<UserStates> {
  SignInUserNotifier() : super(LoadedState());

  get loadingState => state = LoadingState();
  get loadedState => state = LoadedState();

  Future<void> signInUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
