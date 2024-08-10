import 'package:connectify_project/controller/main%20controllers/sections%20controllers/explore%20section%20controller/explore_section_bloc.dart';
import 'package:connectify_project/controller/main%20controllers/sections%20controllers/explore%20section%20controller/explore_section_events.dart';
import 'package:connectify_project/screens/main%20screens/explore%20section/explore_section_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({super.key});
  static const sectionAddress = '/exploreSection';

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ExploreSectionBloc>();
    bloc.add(ExploreSectionInitialLoadingEvent());
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          RefreshIndicator(
            onRefresh: () {
              return Future.value(null);
            },
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return index % 2 == 0
                    ? const ExploreSectionOddIndexWidget()
                    : const ExploreSectionEvenIndexWidget();
              },
            ),
          ),
          const ExploreSectionSearchBarWidget(),
        ],
      ),
    );
  }
}
