import 'package:connectify_project/screens/main%20screens/inbox%20section/inbox_section_widgets.dart';
import 'package:flutter/material.dart';

class InboxSection extends StatelessWidget {
  const InboxSection({super.key});
  static const sectionAddress = '/searchSection';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          InboxSectionAppBarWidget(),
          InboxSectionMessageListWidget(),
        ],
      ),
    );
  }
}
