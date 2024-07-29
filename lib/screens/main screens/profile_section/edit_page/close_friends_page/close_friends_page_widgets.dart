import 'package:flutter/material.dart';

class CloseFriendsPageTitleTextWidget extends StatelessWidget {
  const CloseFriendsPageTitleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return Text(
      'Close Friends',
      style: TextStyle(fontFamily: 'Coffee', fontSize: width * 0.05),
    );
  }
}

class CloseFriendsPageSearchBarWidget extends StatelessWidget {
  const CloseFriendsPageSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width * 0.9,
      child: const SearchBar(
        leading: Icon(Icons.search),
      ),
    );
  }
}

class CloseFriendsPageFriendsList extends StatelessWidget {
  const CloseFriendsPageFriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    bool isChecked = false;
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(radius: width * 0.06),
          title: Text(
            'username',
            style: TextStyle(fontSize: width * 0.04),
          ),
          trailing: StatefulBuilder(builder: (context, state) {
            return Checkbox(
              value: isChecked,
              onChanged: (value) {
                state(() {
                  isChecked = value!;
                });
              },
            );
          }),
        );
      },
    );
  }
}

class CloseFriendsPageUpdateListButton extends StatelessWidget {
  const CloseFriendsPageUpdateListButton({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return SizedBox(
              width: width * 0.4,
              child: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: const WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.02),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 1, child: Icon(Icons.upload)),
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: FittedBox(
                        child: Text('update list'),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}
