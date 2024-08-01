import 'package:connectify_project/screens/main%20screens/explore%20section/explore_section_widgets.dart';
import 'package:flutter/material.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({super.key});
  static const sectionAddress = '/exploreSection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return index % 2 == 0
                  ? const ExploreSectionOddIndexWidget()
                  : const ExploreSectionEvenIndexWidget();
            },
          ),
          const ExploreSectionSearchBarWidget(),
        ],
      ),
    );
  }
}
