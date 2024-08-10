// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
abstract class HomeSectionStates {}

@immutable
class HomeSectionInitialState extends HomeSectionStates {}

@immutable
class HomeSectionStoryClickState extends HomeSectionStates {
  final String username;
  HomeSectionStoryClickState({required this.username});
}

@immutable
class HomeSectionPostCommentState extends HomeSectionStates {}

@immutable
class HomeSectionPostShareState extends HomeSectionStates {}
