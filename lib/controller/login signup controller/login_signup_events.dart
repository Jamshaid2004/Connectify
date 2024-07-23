import 'package:flutter/material.dart';

@immutable
abstract class LoginSignupEvents {}

@immutable
class LoginWithEmailButtonClickEvent extends LoginSignupEvents {
  final BuildContext context;
  LoginWithEmailButtonClickEvent({required this.context});
}

@immutable
class SignupWithEmailButtonClickEvent extends LoginSignupEvents {
  final BuildContext context;
  SignupWithEmailButtonClickEvent({required this.context});
}
