import 'package:connectify_project/controller/main%20controllers/sections%20controllers/profile%20section%20controller/edit%20profile%20controller/edit_profile_page_events.dart';
import 'package:connectify_project/controller/main%20controllers/sections%20controllers/profile%20section%20controller/edit%20profile%20controller/edit_profile_page_states.dart';
import 'package:connectify_project/utils/constants/shared_preferences_constant.dart';
import 'package:connectify_project/utils/constants/user_firestore_doc_constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePageBloc
    extends Bloc<EditProfilePageEvents, EditProfilePageStates> {
  String username = '';
  String password = '';
  EditProfilePageBloc() : super(EditProfilePageInitialState()) {
    var preferences = GetIt.I.get<SharedPreferences>();
    on<EditProfilePageEvents>(
      (event, emit) {
        if (event is EditProfilePageUsernameUpdateEvent) {
          preferences.setString(
              UserFirestoreDocConstants.kUsername, event.username);
          preferences.setString(
              SharedPreferencesConstant.username, event.username);
          emit(EditProfilePageUsernameUpdatedState());
        }
      },
    );
  }
}
