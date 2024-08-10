// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
abstract class HomeSectionEvents {}

@immutable
class HomeSectionNotificationClickEvent extends HomeSectionEvents {
  final BuildContext context;
  HomeSectionNotificationClickEvent({required this.context});
}

@immutable
class HomeSectionStoryClickEvent extends HomeSectionEvents {
  final String username;
  HomeSectionStoryClickEvent({required this.username});
}

@immutable
abstract class HomeSectionPostEvents extends HomeSectionEvents {
  final int postId;
  HomeSectionPostEvents({
    required this.postId,
  });
}

@immutable
class HomeSectionPostLikeEvent extends HomeSectionPostEvents {
  HomeSectionPostLikeEvent({required super.postId});
}

@immutable
class HomeSectionPostCommentEvent extends HomeSectionPostEvents {
  HomeSectionPostCommentEvent({required super.postId});
}

@immutable
class HomeSectionPostShareEvent extends HomeSectionPostEvents {
  HomeSectionPostShareEvent({required super.postId});
}
