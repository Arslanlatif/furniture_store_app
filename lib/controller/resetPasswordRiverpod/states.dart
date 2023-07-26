import 'package:flutter/material.dart';

@immutable
abstract class UserStates {}

@immutable
class LoadingState extends UserStates {}

@immutable
class LoadedState extends UserStates {}
