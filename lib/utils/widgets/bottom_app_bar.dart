import 'package:connectify_project/controller/home%20page%20controller/home_page_bloc.dart';
import 'package:connectify_project/controller/home%20page%20controller/home_page_events.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomePageBloc>();
    var Size(:height) = MediaQuery.sizeOf(context);
    return ConvexAppBar(
      initialActiveIndex: 0,
      backgroundColor: Colors.black,
      height: height * 0.065,
      top: height * -0.03,
      style: TabStyle.flip,
      onTap: (index) {
        bloc.add(HomePageSectionChangeEvent(index: index));
      },
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.search, title: 'Search'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.move_to_inbox, title: 'Inbox'),
        TabItem(icon: Icons.person, title: 'profile'),
      ],
    );
  }
}
