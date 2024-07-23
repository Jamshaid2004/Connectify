import 'package:flutter/material.dart';

class AddSection extends StatelessWidget {
  const AddSection({super.key});
  static const sectionAddress = '/addSection';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Add Section'),
      ),
    );
  }
}
