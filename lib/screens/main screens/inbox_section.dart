import 'package:flutter/material.dart';

class InboxSection extends StatelessWidget {
  const InboxSection({super.key});
  static const sectionAddress = '/searchSection';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Inbox Section'),
      ),
    );
  }
}
