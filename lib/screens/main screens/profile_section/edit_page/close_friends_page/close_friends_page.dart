import 'package:connectify_project/screens/main%20screens/profile_section/edit_page/close_friends_page/close_friends_page_widgets.dart';
import 'package:flutter/material.dart';

class CloseFriendsPage extends StatelessWidget {
  const CloseFriendsPage({super.key});
  static const pageAddress = '/closeFriendsPage';
  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Expanded(flex: 1, child: CloseFriendsPageTitleTextWidget()),
              Expanded(flex: 1, child: CloseFriendsPageSearchBarWidget()),
              Expanded(flex: 13, child: CloseFriendsPageFriendsList())
            ],
          ),
          Positioned(
            bottom: width * 0.01,
            child: const CloseFriendsPageUpdateListButton(),
          )
        ],
      ),
    );
  }
}
