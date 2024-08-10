import 'package:connectify_project/controller/main%20controllers/sections%20controllers/home%20section%20controller/notification%20page%20controller/notification_page_events.dart';
import 'package:connectify_project/controller/main%20controllers/sections%20controllers/home%20section%20controller/notification%20page%20controller/notification_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPageBloc
    extends Bloc<NotificationPageEvents, NotificationPageStates> {
  int count = 20;
  NotificationPageBloc() : super(NotificationPageInitialState()) {
    on<NotificationPageEvents>(
      (event, emit) async {
        if (event is NotificationPageLoadingEvent) {
          await Future.delayed(const Duration(seconds: 10));
          count = count + 5;
          emit(NotificationPageLoadedState());
        }
      },
    );
  }
}
