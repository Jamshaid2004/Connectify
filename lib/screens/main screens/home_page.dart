import 'package:connectify_project/controller/home%20page%20controller/home_page_bloc.dart';
import 'package:connectify_project/controller/home%20page%20controller/home_page_states.dart';
import 'package:connectify_project/screens/error_screen.dart';
import 'package:connectify_project/screens/main%20screens/home_section.dart';
import 'package:connectify_project/utils/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.username});
  static const pageAddress = '/homePage';
  final String username;
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomePageBloc>();
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          bottom: true,
          child: BlocBuilder<HomePageBloc, HomePageStates>(
            builder: (context, state) {
              if (state is HomePageInitialState) {
                return bloc.sectionPages[HomeSection.sectionAddress]!;
              } else if (state is HomePageSectionUpdateState) {
                return state.section;
              } else {
                return const ErrorPage();
              }
            },
          ),
        ),
        bottomNavigationBar: const AppBottomBar(),
      ),
    );
  }
}
