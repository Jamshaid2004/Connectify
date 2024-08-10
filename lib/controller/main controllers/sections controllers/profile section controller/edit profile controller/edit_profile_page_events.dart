// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
abstract class EditProfilePageEvents {}

@immutable
class EditProfilePageUsernameUpdateEvent extends EditProfilePageEvents {
  final String username;

  EditProfilePageUsernameUpdateEvent({required this.username});
}
