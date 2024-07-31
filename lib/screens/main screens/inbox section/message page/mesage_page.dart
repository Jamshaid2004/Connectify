import 'package:connectify_project/screens/main%20screens/inbox%20section/message%20page/message_page_widgets.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MessagePageAppBarWidget(
          context: context, username: username, size: size),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const MessagePageMessageListWidget(),
          Positioned(
              bottom: size.width * 0.05,
              child: const MessagePageTextFieldWidget()),
        ],
      ),
    );
  }
}
