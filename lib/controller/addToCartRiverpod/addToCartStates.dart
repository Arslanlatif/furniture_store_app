import 'package:flutter/material.dart';

@immutable
abstract class AddToCartStates {}

@immutable
class AddToCartLoadingState extends AddToCartStates {}

@immutable
class AddToCartLoadedState extends AddToCartStates {}

@immutable
class AddToCartErrorState extends AddToCartStates {
  final String errorMessage;

  AddToCartErrorState({required this.errorMessage});
}
