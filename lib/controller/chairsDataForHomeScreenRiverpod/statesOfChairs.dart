// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_office_furniture_store_app/Model/modelClassForChairs.dart';


@immutable
abstract class UserStateForChairs {}

@immutable
class LoadingStateForChairs extends UserStateForChairs {}

@immutable
class LoadedStateForChairs extends UserStateForChairs {
  final List<ModelClassForChairs> listForChairModelClass;

  LoadedStateForChairs({
    required this.listForChairModelClass,
  });
}

@immutable
class ErrorStateForChairs extends UserStateForChairs {
  final String error;

  ErrorStateForChairs({
    required this.error,
  });
}
