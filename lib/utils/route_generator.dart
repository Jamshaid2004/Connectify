import 'dart:developer';

import 'package:connectify_project/screens/error_screen.dart';
import 'package:connectify_project/screens/login_screen.dart';
import 'package:connectify_project/screens/main%20screens/home_page.dart';
import 'package:connectify_project/screens/main%20screens/profile_section/edit%20page/edit_page.dart';
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
    SettingsPage.pageAddress =>
      MaterialPageRoute(builder: (context) => const SettingsPage()),
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
