import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForAddToCart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'fetchToCartStates.dart';

final fetchStateProvider =
    StateNotifierProvider<FetchStateNotifier, FetchDataStates>((ref) {
  return FetchStateNotifier();
});

class FetchStateNotifier extends StateNotifier<FetchDataStates> {
  FetchStateNotifier() : super(FetchLoadingState());

  Future<void> fetchCartData() async {
    try {
      var querry =
          await FirebaseFirestore.instance.collection('addToCartData').get();
      List<ModelClassForAddToCart> list = [];

      var document = querry.docs;
      for (var element in document) {
        list.add(ModelClassForAddToCart.fromMap(element.data()));
      }
      state = FetchLoadedState(list: list);
    } catch (e) {
      log(e.toString());
    }
  }
}
