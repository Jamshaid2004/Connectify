import 'package:connectify_project/controller/main%20controllers/sections%20controllers/profile%20section%20controller/edit%20profile%20controller/edit_profile_page_bloc.dart';
import 'package:connectify_project/controller/main%20controllers/sections%20controllers/profile%20section%20controller/edit%20profile%20controller/edit_profile_page_states.dart';
import 'package:connectify_project/screens/main%20screens/profile%20section/edit%20page/edit_page_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String pageAddress = '/settingsPage';

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfilePageBloc, EditProfilePageStates>(
      listener: (context, state) {
        if (state is EditProfilePageUsernameUpdatedState) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(const SnackBar(content: Text('username updated')));
        }
      },
      child: const Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileEditPageCircleAvataorImageWidget(),
                ProfileEditPageEditTextUsernameWidget(),
                ProfileEditPageEditTextPasswordWidget(),
                ProfileEditPageCloseFriendsTab(),
                ProfileEditPageBlockAccountsTab(),
                ProfileEditPageDividerWidget(),
                ProfileEditPagePrivateAccountSwitchWidget(),
                ProfileEditPageDividerWidget(),
                ProfileEditPageLogoutBreakButtonRow(),
                ProfileEditPageAccountDeleteButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
