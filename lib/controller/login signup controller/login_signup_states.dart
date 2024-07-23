import 'package:flutter/material.dart';

@immutable
abstract class LoginSignupStates {}

@immutable
class LoginSignupInitialState extends LoginSignupStates {}

@immutable
class LoginSignupLoadingState extends LoginSignupStates {}

@immutable
class LoginLoadedState extends LoginSignupStates {}

@immutable
class LoginFailedState extends LoginSignupStates {}
