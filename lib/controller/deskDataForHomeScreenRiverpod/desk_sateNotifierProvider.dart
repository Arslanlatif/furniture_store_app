import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForDesk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'statesOfDesk.dart';

final deskStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserStateForDesk>(
        (ref) => UserStateNotifier());

class UserStateNotifier extends StateNotifier<UserStateForDesk> {
  UserStateNotifier() : super(LoadingStateForDesk());

  getDeskData() async {
    try {
      var querry =
          await FirebaseFirestore.instance.collection('deskImages').get();
      var document = querry.docs;

      List<ModelClassForDesk> liist = [];
      for (var x in document) {
        liist.add(ModelClassForDesk.fromMap(x.data()));
      }
      state = LoadedStateForDesk(listForDeskModelClass: liist);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
