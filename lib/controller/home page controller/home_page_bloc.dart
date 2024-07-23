import 'package:connectify_project/controller/home%20page%20controller/home_page_events.dart';
import 'package:connectify_project/controller/home%20page%20controller/home_page_states.dart';
import 'package:connectify_project/screens/main%20screens/add_section.dart';
import 'package:connectify_project/screens/main%20screens/explore_section.dart';
import 'package:connectify_project/screens/main%20screens/home_section.dart';
import 'package:connectify_project/screens/main%20screens/inbox_section.dart';
import 'package:connectify_project/screens/main%20screens/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  Map<String, Widget> sectionPages = {
    HomeSection.sectionAddress: const HomeSection(),
    ProfileSection.sectionAddress: const ProfileSection(),
    AddSection.sectionAddress: const AddSection(),
    ExploreSection.sectionAddress: const ExploreSection(),
    InboxSection.sectionAddress: const InboxSection(),
  };

  HomePageBloc() : super(HomePageInitialState()) {
    on<HomePageEvents>(
      (event, emit) {
        if (event is HomePageSectionChangeEvent) {
          String sectionAddress = switch (event.index) {
            0 => HomeSection.sectionAddress,
            1 => ExploreSection.sectionAddress,
            2 => AddSection.sectionAddress,
            3 => InboxSection.sectionAddress,
            _ => ProfileSection.sectionAddress,
          };
          Widget sectionUpdateState = sectionPages[sectionAddress]!;
          emit(HomePageSectionUpdateState(section: sectionUpdateState));
        }
      },
    );
  }
}
