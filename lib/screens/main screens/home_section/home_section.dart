import 'package:connectify_project/screens/main%20screens/home_section/home_section_widgets.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});
  static const sectionAddress = '/homeSection';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeSectionAppBarWidget(),
          HomeSectionStoriesWidget(),
          HomeSectionPostsWidget(),
        ],
      ),
    );
  }
}
