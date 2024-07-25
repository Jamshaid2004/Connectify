import 'package:connectify_project/screens/login_screen.dart';
import 'package:connectify_project/utils/constants/shared_preferences_constant.dart';
import 'package:connectify_project/utils/constants/sign_in_method_constant.dart';
import 'package:connectify_project/utils/constants/user_firestore_doc_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditPageCircleAvataorImageWidget extends StatelessWidget {
  const ProfileEditPageCircleAvataorImageWidget({super.key});
  static const String image = 'assets/images/no_profile_image.jpeg';
  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: GestureDetector(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 50, color: Colors.grey, spreadRadius: 1),
            ],
          ),
          child: CircleAvatar(
            radius: width * 0.13,
            backgroundImage: const AssetImage(image),
          ),
        ),
      ),
    );
  }
}

class ProfileEditPageEditTextUsernameWidget extends StatelessWidget {
  const ProfileEditPageEditTextUsernameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var preferences = GetIt.I.get<SharedPreferences>();
    var Size(:width) = MediaQuery.sizeOf(context);
    String username =
        preferences.getString(UserFirestoreDocConstants.kUsername)!;
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: SizedBox(
        width: width * 0.6,
        child: TextFormField(
          cursorColor: Colors.white,
          initialValue: username,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusColor: Colors.white,
            labelText: 'username',
          ),
        ),
      ),
    );
  }
}

class ProfileEditPageEditTextPasswordWidget extends StatelessWidget {
  const ProfileEditPageEditTextPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var preferences = GetIt.I.get<SharedPreferences>();

    return Builder(
      builder: (context) {
        if (preferences.getString(SharedPreferencesConstant.signInMethod) ==
            SignInMethod.signInByEmail) {
          return const Text('update password');
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class ProfileEditPagePrivateAccountSwitchWidget extends StatelessWidget {
  const ProfileEditPagePrivateAccountSwitchWidget({super.key});
  static const String privateAccountDescription =
      'This Private Account option will hide your posts and stories from other users but people who are added with you (your followers) will still be able to see all of your posts and stories.';
  @override
  Widget build(BuildContext context) {
    bool switchState = true;
    var Size(:width) = MediaQuery.sizeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Private my Account',
          style: TextStyle(fontSize: width * 0.04),
        ),
        StatefulBuilder(builder: (context, setState) {
          return Column(
            children: [
              Switch(
                activeColor: Colors.blue,
                value: switchState,
                onChanged: (value) {
                  setState(() {
                    switchState = value;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: Text(
                  privateAccountDescription,
                  style: TextStyle(fontSize: width * 0.03, color: Colors.grey),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}

class ProfileEditPageLogoutBreakButtonRow extends StatelessWidget {
  const ProfileEditPageLogoutBreakButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    var preferences = GetIt.I.get<SharedPreferences>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              shadowColor: const WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.02),
                  ),
                ),
              ),
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (preferences
                      .getString(SharedPreferencesConstant.signInMethod) ==
                  SignInMethod.signInByGoogle) {
                await GoogleSignIn().signOut();
              }
              if (context.mounted) {
                Navigator.of(context).popAndPushNamed(LoginPage.pageAddress);
              }
            },
            child: const Text('Logout')),
        SizedBox(width: width * 0.02),
        ElevatedButton(
            style: ButtonStyle(
              shadowColor: const WidgetStatePropertyAll(Colors.white),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(width * 0.02),
                  ),
                ),
              ),
            ),
            onPressed: () {},
            child: const Text('take a break')),
      ],
    );
  }
}

class ProfileEditPageAccountDeleteButtonWidget extends StatelessWidget {
  const ProfileEditPageAccountDeleteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return ElevatedButton(
        style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
                TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold)),
            backgroundColor: const WidgetStatePropertyAll(Colors.red),
            shadowColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(width * 0.02))))),
        onPressed: () {},
        child: const Text('Delete this Account Permanently'));
  }
}

class ProfileEditPageDividerWidget extends StatelessWidget {
  const ProfileEditPageDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return Divider(indent: width * 0.1, endIndent: width * 0.1);
  }
}
