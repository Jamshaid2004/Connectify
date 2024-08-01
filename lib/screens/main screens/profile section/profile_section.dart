import 'package:connectify_project/screens/main%20screens/profile%20section/profile_section_widgets.dart';

import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});
  static const sectionAddress = '/profileSection';

  @override
  Widget build(BuildContext context) {
    final Size(:width) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const CustomScrollView(
              slivers: [
                ProfileSectionOverviewWidget(),
                ProfileSectionPostsWidget(),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.05),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: width * 0.13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
