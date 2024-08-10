import 'package:connectify_project/controller/main%20controllers/sections%20controllers/home%20section%20controller/notification%20page%20controller/notification_page_bloc.dart';
import 'package:connectify_project/controller/main%20controllers/sections%20controllers/home%20section%20controller/notification%20page%20controller/notification_page_events.dart';
import 'package:connectify_project/controller/main%20controllers/sections%20controllers/home%20section%20controller/notification%20page%20controller/notification_page_states.dart';
import 'package:connectify_project/screens/main%20screens/home%20section/notification%20page/notification_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static const pageAddress = '/notificationPage';
  @override
  Widget build(BuildContext context) {
    var controller = context.read<NotificationPageBloc>();
    final Size(:width) = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Notifications',
            style: TextStyle(fontSize: width * 0.05),
          ),
          automaticallyImplyLeading: false),
      body: Center(
        child: BlocBuilder<NotificationPageBloc, NotificationPageStates>(
          builder: (context, state) {
            int count = controller.count;

            return ListView.builder(
              itemCount: count,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const NotificationDayWidget();
                } else if (index == count - 1) {
                  controller.add(NotificationPageLoadingEvent());
                  return const Center(
                      child: CircularProgressIndicator(color: Colors.white));
                } else {
                  return const NotificationTileWidget();
                }
              },
            );
          },
        ),
      ),
    );
  }
}
