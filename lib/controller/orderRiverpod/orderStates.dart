import 'package:flutter/material.dart';

@immutable
abstract class OrderStates {}

@immutable
class OrderLoadingState extends OrderStates {}

@immutable
class OrderLoadedState extends OrderStates {
  
}

@immutable
class OrderErrorState extends OrderStates {
  final String errorMessage;

  OrderErrorState({required this.errorMessage});
}
