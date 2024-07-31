import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static const pageAddress = '/notificationPage';
  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(fontSize: width * 0.05),
          ),
          automaticallyImplyLeading: false),
      body: Center(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child:
                      Text('Today', style: TextStyle(fontSize: width * 0.06)),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  top: width * 0.02,
                  bottom: width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(backgroundColor: Colors.white),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'username ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'the activity they did',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
