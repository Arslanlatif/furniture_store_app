import 'package:flutter/material.dart';

import '../../Model/modelClassForAddToCart.dart';

@immutable
abstract class FetchDataStates {}

@immutable
class FetchLoadingState extends FetchDataStates {}

@immutable
class FetchLoadedState extends FetchDataStates {
  final List<ModelClassForAddToCart> list;

  FetchLoadedState({required this.list});
}

@immutable
class FetchErrorState extends FetchDataStates {
  final String errorMessage;

  FetchErrorState({
    required this.errorMessage,
  });
}
