import 'package:connectify_project/screens/main%20screens/profile_section/edit_page/edit_page_widgets.dart';

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const String pageAddress = '/settingsPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    );
  }
}
