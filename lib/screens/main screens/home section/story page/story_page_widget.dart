import 'dart:developer';

import 'package:flutter/material.dart';

class StoryPageStoryWidget extends StatelessWidget {
  const StoryPageStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black);
  }
}

class StoryPageUsernameAndStatusProgressWidget extends StatelessWidget {
  const StoryPageUsernameAndStatusProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          StoryPageUsernameWidget(),
          StoryPageStoryProgressWidget(),
        ],
      ),
    );
  }
}

class StoryPageUsernameWidget extends StatelessWidget {
  const StoryPageUsernameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(backgroundColor: Colors.white, radius: width * 0.07),
        SizedBox(width: width * 0.05),
        Text('username', style: TextStyle(fontSize: width * 0.06)),
      ],
    );
  }
}

class StoryPageStoryProgressWidget extends StatelessWidget {
  const StoryPageStoryProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    double valueOfProgress = 0;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StatefulBuilder(
        builder: (context, setState) {
          Future.delayed(
            const Duration(milliseconds: 1),
            () {
              log('value of Progress : $valueOfProgress');
              if (valueOfProgress > 1) {
                log('page poped');
                Navigator.of(context).pop();
              } else {
                setState(
                  () {
                    valueOfProgress = valueOfProgress + 0.001;
                  },
                );
              }
            },
          );
          return SizedBox(
            width: width * 0.9,
            child: LinearProgressIndicator(
              minHeight: width * 0.003,
              backgroundColor: Colors.grey,
              value: valueOfProgress,
            ),
          );
        },
      ),
    );
  }
}

class StoryPageStoryReplyAndLikeWidget extends StatelessWidget {
  const StoryPageStoryReplyAndLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    Color favColor = Colors.white;
    return SafeArea(
      child: SizedBox(
        width: width,
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(width * 0.03))),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        favColor = favColor == Colors.white
                            ? Colors.red
                            : Colors.white;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: favColor,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
