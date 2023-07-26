import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_office_furniture_store_app/controller/fetchToCart/fetchToCartWidgetStates.dart';
import 'package:flutter_office_furniture_store_app/controller/orderRiverpod/orderStates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final orderStateProvider =
    StateNotifierProvider<OrderStateNotifier, OrderStates>((ref) {
  return OrderStateNotifier();
});

class OrderStateNotifier extends StateNotifier<OrderStates> {
  OrderStateNotifier() : super(OrderLoadedState());

 orderSave({
     String? address,
     String? number,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('orderData')
          .doc()
          .set({'list': list2, 'address': address, 'number': number});

      state = OrderLoadedState();
    } catch (e) {
      log(e.toString());
    }
  }
}
