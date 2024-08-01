import 'package:connectify_project/screens/main%20screens/home%20section/story%20page/story_page_widget.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy > 8 && details.delta.dx < 0) {
          Navigator.of(context).pop();
        }
      },
      child: const Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            StoryPageStoryWidget(),
            Positioned(
                top: 0, child: StoryPageUsernameAndStatusProgressWidget()),
            Positioned(bottom: 0, child: StoryPageStoryReplyAndLikeWidget()),
          ],
        ),
      ),
    );
  }
}
