import 'package:flutter/material.dart';

@immutable
abstract class HomePageStates {}

@immutable
class HomePageInitialState extends HomePageStates {}

@immutable
class HomePageSectionUpdateState extends HomePageStates {
  final Widget section;
  HomePageSectionUpdateState({required this.section});
}
