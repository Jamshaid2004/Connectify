import 'package:flutter/material.dart';

@immutable
abstract class HomePageEvents {}

@immutable
class HomePageSectionChangeEvent extends HomePageEvents {
  final int index;
  HomePageSectionChangeEvent({required this.index});
}
