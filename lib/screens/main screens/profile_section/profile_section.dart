import 'package:connectify_project/screens/main%20screens/profile_section/profile_section_widgets.dart';

import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});
  static const sectionAddress = '/profileSection';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                ProfileSectionOverviewWidget(),
                ProfileSectionPostsWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/// logout button click method

