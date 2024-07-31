import 'package:flutter/material.dart';

class BlockedAccountsPage extends StatelessWidget {
  const BlockedAccountsPage({super.key});
  static const pageAddress = '/blockedAccountsPage';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Blocked Accounts Page'),
      ),
    );
  }
}
