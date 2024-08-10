import 'package:connectify_project/controller/main%20controllers/sections%20controllers/explore%20section%20controller/explore_section_events.dart';
import 'package:connectify_project/controller/main%20controllers/sections%20controllers/explore%20section%20controller/explore_section_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreSectionBloc
    extends Bloc<ExploreSectionEvents, ExploreSectionStates> {
  _fetchInitialExplorePosts() async {
    await Future.delayed(const Duration(seconds: 10));
  }

  ExploreSectionBloc() : super(ExploreSectionInitialState()) {
    on<ExploreSectionEvents>(
      (event, emit) {
        if (event is ExploreSectionInitialLoadingEvent) {
          _fetchInitialExplorePosts();
          emit(ExploreSectionInitialLoadingState());
        }
      },
    );
  }
}
