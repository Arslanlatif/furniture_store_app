// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../Model/modelClassForDesk.dart';

@immutable
abstract class UserStateForDesk {}

@immutable
class LoadingStateForDesk extends UserStateForDesk {}

@immutable
class LoadedStateForDesk extends UserStateForDesk {
  final List<ModelClassForDesk> listForDeskModelClass;

  LoadedStateForDesk({
    required this.listForDeskModelClass,
  });
}

@immutable
class ErrorStateForDesk extends UserStateForDesk {
  final String error;

  ErrorStateForDesk({
    required this.error,
  });
}
