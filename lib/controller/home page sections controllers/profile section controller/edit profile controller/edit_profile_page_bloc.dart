import 'package:connectify_project/controller/home%20page%20sections%20controllers/profile%20section%20controller/edit%20profile%20controller/edit_profile_page_events.dart';
import 'package:connectify_project/controller/home%20page%20sections%20controllers/profile%20section%20controller/edit%20profile%20controller/edit_profile_page_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePageBloc
    extends Bloc<EditProfilePageEvents, EditProfilePageStates> {
  EditProfilePageBloc() : super(EditProfilePageInitialState()) {
    on<EditProfilePageEvents>(
      (event, emit) {},
    );
  }
}
