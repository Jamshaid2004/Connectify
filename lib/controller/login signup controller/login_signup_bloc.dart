import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectify_project/controller/login%20signup%20controller/login_signup_events.dart';
import 'package:connectify_project/controller/login%20signup%20controller/login_signup_states.dart';
import 'package:connectify_project/screens/login_screen.dart';
import 'package:connectify_project/screens/main%20screens/home_page.dart';
import 'package:connectify_project/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvents, LoginSignupStates> {
  final String titleApp = 'connectify_title';
  static const String kEmail = 'email';
  static const String kUsername = 'username';
  static const String kfirebaseUsernameCollection =
      'usernameAndEmailCollection';
  TextEditingController emailLoginPageController = TextEditingController();
  TextEditingController passwordLoginPageController = TextEditingController();
  TextEditingController emailSignupPageController = TextEditingController();
  TextEditingController passwordSignupPageController = TextEditingController();
  TextEditingController usernameSignupPageController = TextEditingController();

  GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();
  final firebaseStorageBox = FirebaseFirestore.instance;
  String? usernameValidator(String? value) {
    if (value == '' || value == null) {
      return "required field is empty";
    } else {
      return (value.length >= 5) ? null : 'username is too short';
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value == '') {
      return 'required field is empty';
    } else {
      // log(value.substring(value.length - 10));
      return (value.length > 13 &&
              (value.substring(value.length - 10) == '@gmail.com'))
          ? null
          : 'not a valid email';
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value == '') {
      return 'required field is empty';
    } else {
      return value.length >= 8
          ? null
          : 'password must be at least 8 characters';
    }
  }

  Future<void> loginButtonClick(BuildContext context) async {
    String email = emailLoginPageController.text;
    String password = passwordLoginPageController.text;

    if (loginFormkey.currentState!.validate()) {
      log('login form validated');

      try {
        log('email $email password $password');
        var credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        log(credential.user!.email.toString());
        log('successfully sign in to firebase');
        emailLoginPageController.clear();
        passwordLoginPageController.clear();
        await firebaseStorageBox
            .collection(kfirebaseUsernameCollection)
            .where(kEmail, isEqualTo: email)
            .get()
            .then(
          (value) {
            log(value.docs.first.data()[kUsername]);
            Navigator.of(context).popAndPushNamed(HomePage.pageAddress,
                arguments: value.docs.first.data()[kUsername]);
          },
        );
      } on FirebaseAuthException catch (e) {
        log(e.credential.toString());
        log(e.message.toString());
        if (context.mounted) {
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Email is not Signed up')));
          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('wrong password')));
          } else if (e.code == 'too-many-requests') {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Too many requests')));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.code)));
          }
        }
      }
    }
    log('log in button clicked');
  }

  Future<void> signupButtonClick(BuildContext context) async {
    String username = usernameSignupPageController.text;
    String email = emailSignupPageController.text;
    String password = passwordSignupPageController.text;
    log('Sign up button clicked');
    if (signupFormkey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Map<String, dynamic> usernameMap = {
          kEmail: email,
          kUsername: username,
        };
        usernameSignupPageController.clear();
        emailSignupPageController.clear();
        passwordSignupPageController.clear();
        await firebaseStorageBox
            .collection(kfirebaseUsernameCollection)
            .add(usernameMap);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('signed up successfully')));
          Navigator.of(context)
              .popAndPushNamed(HomePage.pageAddress, arguments: username);
        }
      } on FirebaseAuthException catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        }
      }
    }
  }

  signupWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    Map<String, dynamic> usernameMap = {
      kEmail: googleUser?.email,
      kUsername: googleUser?.displayName,
    };
    await firebaseStorageBox
        .collection(kfirebaseUsernameCollection)
        .add(usernameMap);
    final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    await FirebaseAuth.instance.signInWithCredential(credentials);
    if (context.mounted) {
      Navigator.of(context).popAndPushNamed(HomePage.pageAddress);
    }
  }

  navigateToSignupPageButtonClick(BuildContext context) {
    log('moved to signup page button clicked');
    Navigator.of(context).popAndPushNamed(SignupPage.pageAddress);
  }

  navigateToLoginPageButtonClick(BuildContext context) {
    log('moved to login page button clicked');
    Navigator.of(context).popAndPushNamed(LoginPage.pageAddress);
  }

  LoginSignupBloc() : super(LoginSignupInitialState()) {
    on<LoginSignupEvents>(
      (event, emit) async {
        if (event is LoginWithEmailButtonClickEvent) {
          log('Login Page : loading state emitted');
          emit(LoginSignupLoadingState());
          await loginButtonClick(event.context);
          log('Login Page : loaded state emitted');
          emit(LoginSignupInitialState());
        } else if (event is SignupWithEmailButtonClickEvent) {
          log('Signup Page : loading state emitted');
          emit(LoginSignupLoadingState());
          await signupButtonClick(event.context);
          log('Signup Page : loaded state emitted');
          emit(LoginSignupInitialState());
        }
      },
    );
  }
}
