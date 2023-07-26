import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'states.dart';

final resetPasswordStateNotifier =
    StateNotifierProvider<UserNotifier, UserStates>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserStates> {
  UserNotifier() : super(LoadedState());

  get loadingState => state = LoadingState();
  get loadedState => state = LoadedState();

  Future<void> resetPasswordWithEmail(
      {required String email, BuildContext? context}) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .whenComplete(() {
        ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
            content: Text(
                'We have send you email to recovery password,please check email')));
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context!)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      });
    } catch (e) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
