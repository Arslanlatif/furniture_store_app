import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForChairs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'statesOfChairs.dart';

final chairsStateNotifierProvider =
    StateNotifierProvider<UserNotifier, UserStateForChairs>(
        (ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserStateForChairs> {
  UserNotifier() : super(LoadingStateForChairs());

  Future<void> getChairsData() async {
    try {
      var querry =
          await FirebaseFirestore.instance.collection('listData').get();

      final document = querry.docs;
      List<ModelClassForChairs> listt = [];

      for (var element in document) {
        listt.add(ModelClassForChairs.fromMap(element.data()));
      }
      state = LoadedStateForChairs(listForChairModelClass: listt);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
