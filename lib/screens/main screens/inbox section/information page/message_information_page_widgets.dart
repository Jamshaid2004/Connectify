import 'package:flutter/material.dart';

class MessageInformationPageProfileImageWidget extends StatelessWidget {
  const MessageInformationPageProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return CircleAvatar(
      radius: width * 0.1,
      backgroundColor: Colors.blueAccent,
    );
  }
}

class MessageInformationPageUsernameTitleTextWidget extends StatelessWidget {
  const MessageInformationPageUsernameTitleTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: Text(
        'username',
        style: TextStyle(fontSize: width * 0.07, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MessageInformationPageDateJoinedTextWidget extends StatelessWidget {
  const MessageInformationPageDateJoinedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Date Joined', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('08 January 2024'),
        ],
      ),
    );
  }
}

class MessageInformationPageButtonRowWidget extends StatelessWidget {
  const MessageInformationPageButtonRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                      const SnackBar(content: Text('Profile Button Clicked')));
              },
              icon: const MessageInformationPageButtonIconWidget(
                icon: Icons.person,
                name: 'Profile',
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                      const SnackBar(content: Text('Remove Button Clicked')));
              },
              icon: const MessageInformationPageButtonIconWidget(
                icon: Icons.remove,
                name: 'Remove',
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                      const SnackBar(content: Text('Report Button Clicked')));
              },
              icon: const MessageInformationPageButtonIconWidget(
                icon: Icons.report,
                name: 'Report',
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                      const SnackBar(content: Text('Block Button Clicked')));
              },
              icon: const MessageInformationPageButtonIconWidget(
                icon: Icons.block,
                name: 'Block',
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}

class MessageInformationPageButtonIconWidget extends StatelessWidget {
  const MessageInformationPageButtonIconWidget(
      {super.key, required this.icon, required this.name, required this.color});
  final IconData icon;
  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: width * 0.06,
        ),
        Text(
          name,
          style: TextStyle(fontSize: width * 0.025),
        ),
      ],
    );
  }
}

class MessageInformationPageBackgroundImage extends StatelessWidget {
  const MessageInformationPageBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(const SnackBar(content: Text('custom Background')));
      },
      child: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Custom Background',
              style: TextStyle(fontSize: width * 0.04),
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}

class MessageInformationPageMuteNotificationsSwitchWidget
    extends StatelessWidget {
  const MessageInformationPageMuteNotificationsSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    bool muteSwitch = true;
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Mute Notifications'),
              StatefulBuilder(
                builder: (context, setState) {
                  return Switch(
                    activeColor: Colors.blue,
                    value: muteSwitch,
                    onChanged: (value) {
                      setState(
                        () {
                          muteSwitch = value;
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MessageInformationPageMessageColorThemeWidget extends StatelessWidget {
  const MessageInformationPageMessageColorThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(const SnackBar(content: Text('Message Theme')));
      },
      child: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Message Theme'),
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  gradient:
                      const LinearGradient(colors: [Colors.blue, Colors.pink])),
              child: SizedBox(width: width * 0.06, height: width * 0.05),
            )
          ],
        ),
      ),
    );
  }
}
