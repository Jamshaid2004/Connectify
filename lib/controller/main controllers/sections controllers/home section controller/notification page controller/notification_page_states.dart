import 'package:flutter/material.dart';

@immutable
abstract class NotificationPageStates {}

@immutable
class NotificationPageInitialState extends NotificationPageStates {}

@immutable
class NotificationPageLoadingState extends NotificationPageStates {}

@immutable
class NotificationPageLoadedState extends NotificationPageStates {}