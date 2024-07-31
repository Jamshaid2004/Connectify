import 'package:connectify_project/screens/main%20screens/inbox%20section/message%20page/mesage_page.dart';
import 'package:connectify_project/utils/constants/shared_preferences_constant.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InboxSectionAppBarWidget extends StatelessWidget {
  const InboxSectionAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    return SliverAppBar(
      title: Text(
        GetIt.I
            .get<SharedPreferences>()
            .getString(SharedPreferencesConstant.username)!,
        style: TextStyle(fontFamily: 'Coffee', fontSize: height * 0.04),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Icon(
            Icons.search,
            size: width * 0.09,
          ),
        )
      ],
      automaticallyImplyLeading: false,
    );
  }
}

class InboxSectionMessageListWidget extends StatelessWidget {
  const InboxSectionMessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return InboxSectionMessageTile(index: index);
      },
    );
  }
}

class InboxSectionMessageTile extends StatelessWidget {
  const InboxSectionMessageTile({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MessagePage(username: index.toString()),
        ));
      },
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(width * 0.01),
              child: CircleAvatar(
                radius: width * 0.08,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'user name',
                  style: TextStyle(),
                ),
                Text(
                  'last message is shown here',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: FittedBox(
              child: Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: const Text('11:00 am'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
