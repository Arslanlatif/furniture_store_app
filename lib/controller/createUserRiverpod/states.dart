import 'package:flutter/material.dart';

@immutable
abstract class UserStates {}

@immutable
class LoadingStateForUser extends UserStates {}

@immutable
class LoadedStateForuser extends UserStates {}
