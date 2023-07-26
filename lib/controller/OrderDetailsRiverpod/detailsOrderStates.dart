// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_office_furniture_store_app/Model/modelClassForDetailOrder.dart';

@immutable
abstract class DetailOrderStates {}

@immutable
class DetailOrderLoadingState extends DetailOrderStates {}

@immutable
class DetailOrderLoadedState extends DetailOrderStates {
  final List<ModelClassForDetailOrder> list;

  DetailOrderLoadedState({
    required this.list,
  });
}

@immutable
class DetailOrderErrorState extends DetailOrderStates {
  final String errorMessage;

  DetailOrderErrorState({required this.errorMessage});
}
