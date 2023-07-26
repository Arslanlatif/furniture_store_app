import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForDetailOrder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'detailsOrderStates.dart';

final detailOrderStateProvider =
    StateNotifierProvider<DetailOrderStateNotifier, DetailOrderStates>((ref) {
  return DetailOrderStateNotifier();
});

class DetailOrderStateNotifier extends StateNotifier<DetailOrderStates> {
  DetailOrderStateNotifier() : super(DetailOrderLoadingState());

  fetchDetialOrder() async {
    try {
      var querry =
          await FirebaseFirestore.instance.collection('orderData').get();

      List<ModelClassForDetailOrder> list = [];

      var document = querry.docs;
      for (var element in document) {
        list.add(ModelClassForDetailOrder.fromMap(element.data()));
      }

      state = DetailOrderLoadedState(list: list);
    } catch (e) {
      log(e.toString());
    }
  }
}
