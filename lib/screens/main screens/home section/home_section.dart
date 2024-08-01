import 'package:connectify_project/controller/main%20controllers/home%20sections%20controllers/home%20section%20controller/home%20controller/home_section_controller.dart';
import 'package:connectify_project/controller/main%20controllers/home%20sections%20controllers/home%20section%20controller/home%20controller/home_section_states.dart';
import 'package:connectify_project/screens/main%20screens/home%20section/home_section_widgets.dart';
import 'package:connectify_project/screens/main%20screens/home%20section/story%20page/story_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});
  static const sectionAddress = '/homeSection';
  void navigateToStoryPage(BuildContext context, String username) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return StoryPage(username: username);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return BlocListener<HomeSectionBloc, HomeSectionStates>(
      listener: (context, state) {
        if (state is HomeSectionStoryClickState) {
          navigateToStoryPage(context, state.username);
        } else if (state is HomeSectionPostCommentState) {
          showBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                width: width,
                height: height * 0.7,
                child: const Center(child: Text('Comments Bottom Sheet')),
              );
            },
          );
        } else if (state is HomeSectionPostShareState) {
          showBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                  width: width,
                  height: height * 0.7,
                  child: const Center(child: Text('Share Bottom Sheet')));
            },
          );
        }
      },
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            HomeSectionAppBarWidget(),
            HomeSectionStoriesWidget(),
            HomeSectionPostsWidget(),
          ],
        ),
      ),
    );
  }
}
