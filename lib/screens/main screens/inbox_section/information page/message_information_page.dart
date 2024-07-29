import 'package:flutter/material.dart';

class MessageInformationPage extends StatelessWidget {
  const MessageInformationPage({super.key});
  static const pageAddress = '/messageInformationPage';
  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: width * 0.1,
              backgroundColor: Colors.white,
            ),
            Text('username'),
          ],
        ),
      ),
    );
  }
}
