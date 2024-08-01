import 'package:connectify_project/controller/main%20controllers/home%20sections%20controllers/home%20section%20controller/home%20controller/home_section_events.dart';
import 'package:connectify_project/controller/main%20controllers/home%20sections%20controllers/home%20section%20controller/home%20controller/home_section_states.dart';
import 'package:connectify_project/screens/main%20screens/home%20section/notification%20page/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSectionBloc extends Bloc<HomeSectionEvents, HomeSectionStates> {
  HomeSectionBloc() : super(HomeSectionInitialState()) {
    on<HomeSectionEvents>(
      (event, emit) {
        if (event is HomeSectionNotificationClickEvent) {
          ScaffoldMessenger.of(event.context)
            ..clearSnackBars()
            ..showSnackBar(
                const SnackBar(content: Text('notification page clicked')));
          Navigator.of(event.context).pushNamed(NotificationPage.pageAddress);
        } else if (event is HomeSectionStoryClickEvent) {
          emit(HomeSectionStoryClickState(username: event.username));
        }
      },
    );
    on<HomeSectionPostEvents>(
      (event, emit) {
        if (event is HomeSectionPostLikeEvent) {
        } else if (event is HomeSectionPostCommentEvent) {
          emit(HomeSectionPostCommentState());
        } else if (event is HomeSectionPostShareEvent) {
          emit(HomeSectionPostShareState());
        }
      },
    );
  }
}
