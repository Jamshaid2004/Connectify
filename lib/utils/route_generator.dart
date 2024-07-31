import 'dart:developer';

import 'package:connectify_project/screens/error_screen.dart';
import 'package:connectify_project/screens/login_screen.dart';
import 'package:connectify_project/screens/main%20screens/home%20section/notification%20page/notification_page.dart';
import 'package:connectify_project/screens/main%20screens/home_page.dart';
import 'package:connectify_project/screens/main%20screens/inbox%20section/information%20page/message_information_page.dart';
import 'package:connectify_project/screens/main%20screens/profile%20section/edit%20page/blocked%20accounts%20page/blocked_accounts_page.dart';
import 'package:connectify_project/screens/main%20screens/profile%20section/edit%20page/close%20friends%20page/close_friends_page.dart';
import 'package:connectify_project/screens/main%20screens/profile%20section/edit%20page/edit_page.dart';
import 'package:connectify_project/screens/signup_screen.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  var pageAddress = settings.name;
  return switch (pageAddress) {
    SignupPage.pageAddress => createPage(page: const SignupPage()),
    LoginPage.pageAddress => createPage(page: const LoginPage()),
    HomePage.pageAddress => MaterialPageRoute(
        builder: (context) =>
            HomePage(username: settings.arguments.toString())),
    MessageInformationPage.pageAddress =>
      MaterialPageRoute(builder: (context) => const MessageInformationPage()),
    SettingsPage.pageAddress =>
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    NotificationPage.pageAddress =>
      MaterialPageRoute(builder: (context) => const NotificationPage()),
    CloseFriendsPage.pageAddress =>
      MaterialPageRoute(builder: (context) => const CloseFriendsPage()),
    BlockedAccountsPage.pageAddress =>
      MaterialPageRoute(builder: (context) => const BlockedAccountsPage()),
    _ => MaterialPageRoute(builder: (context) => const ErrorPage()),
  };
}

Route createPage({required Widget page}) {
  log('page build');
  return PageRouteBuilder(
    transitionDuration: const Duration(seconds: 3),
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
  );
}
