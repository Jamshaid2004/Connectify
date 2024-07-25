import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(username,
            style:
                ThemeData.dark().textTheme.titleLarge!.copyWith(fontSize: 40)),
      ),
    );
  }
}
