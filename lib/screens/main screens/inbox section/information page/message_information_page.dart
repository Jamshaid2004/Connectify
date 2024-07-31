import 'package:connectify_project/screens/main%20screens/inbox%20section/information%20page/message_information_page_widgets.dart';
import 'package:flutter/material.dart';

class MessageInformationPage extends StatelessWidget {
  const MessageInformationPage({super.key});
  static const pageAddress = '/messageInformationPage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MessageInformationPageProfileImageWidget(),
            MessageInformationPageUsernameTitleTextWidget(),
            MessageInformationPageButtonRowWidget(),
            MessageInformationPageDateJoinedTextWidget(),
            MessageInformationPageMuteNotificationsSwitchWidget(),
            MessageInformationPageBackgroundImage(),
            MessageInformationPageMessageColorThemeWidget()
          ],
        ),
      ),
    );
  }
}
