import 'dart:developer';
import 'dart:io';

import 'package:connectify_project/screens/login_screen.dart';
import 'package:connectify_project/screens/main%20screens/profile%20section/edit%20page/blocked%20accounts%20page/blocked_accounts_page.dart';
import 'package:connectify_project/screens/main%20screens/profile%20section/edit%20page/close%20friends%20page/close_friends_page.dart';
import 'package:connectify_project/utils/constants/shared_preferences_constant.dart';
import 'package:connectify_project/utils/constants/sign_in_method_constant.dart';
import 'package:connectify_project/utils/constants/user_firestore_doc_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditPageCircleAvataorImageWidget extends StatelessWidget {
  const ProfileEditPageCircleAvataorImageWidget({super.key});
  static const String image = 'assets/images/no_profile_image.jpeg';

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    XFile? xFile;
    File? imageFile;
    return Padding(
      padding: EdgeInsets.all(width * 0.05),
      child: StatefulBuilder(builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            try {
              xFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (xFile != null) {
                imageFile = File(xFile!.path);
              }
              state(() {});
            } on Exception catch (e) {
              log(e.toString());
            }
          },
          child: DecoratedBox(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(blurRadius: 50, color: Colors.grey, spreadRadius: 1),
              ],
            ),
            child: Stack(
              children: [
                Builder(
                  builder: (context) {
                    if (imageFile != null) {
                      if (imageFile!.path == '') {
                        return CircleAvatar(
                          radius: width * 0.13,
                          backgroundImage: const AssetImage(image),
                        );
                      } else {
                        return CircleAvatar(
                            radius: width * 0.13,
                            backgroundImage: FileImage(imageFile!));
                      }
                    } else {
                      return CircleAvatar(
                        radius: width * 0.13,
                        backgroundImage: const AssetImage(
                            'assets/images/no_profile_image.jpeg'),
                      );
                    }
                  },
                ),
                Positioned(
                    right: width * 0.005,
                    bottom: width * 0.005,
                    child: Icon(Icons.edit))
              ],
            ),
          ),
        );
      }),
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
      padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      child: SizedBox(
        width: width * 0.6,
        child: TextFormField(
          cursorColor: Colors.white,
          initialValue: username,
          decoration: InputDecoration(
            suffix: GestureDetector(child: const Icon(Icons.check)),
            prefixIcon: const Icon(Icons.person),
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
    var Size(:width) = MediaQuery.sizeOf(context);
    return Builder(
      builder: (context) {
        if (preferences.getString(SharedPreferencesConstant.signInMethod) ==
            SignInMethod.signInByEmail) {
          return Padding(
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: SizedBox(
              width: width * 0.6,
              child: TextFormField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffix: GestureDetector(child: const Icon(Icons.check)),
                  prefixIcon: const Icon(Icons.lock),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusColor: Colors.white,
                  labelText: 'password',
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class ProfileEditPageBlockAccountsTab extends StatelessWidget {
  const ProfileEditPageBlockAccountsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(BlockedAccountsPage.pageAddress);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: const Text('Blocked Accounts'),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: const Row(
              children: [Text('0'), Icon(Icons.arrow_forward_ios_rounded)],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileEditPageCloseFriendsTab extends StatelessWidget {
  const ProfileEditPageCloseFriendsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CloseFriendsPage.pageAddress);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: const Text('Close Friends'),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: const Row(
              children: [Text('0'), Icon(Icons.arrow_forward_ios_rounded)],
            ),
          )
        ],
      ),
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Private my Account',
              style: TextStyle(fontSize: width * 0.04),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return Switch(
                  activeColor: Colors.blue,
                  value: switchState,
                  onChanged: (value) {
                    setState(() {
                      switchState = value;
                    });
                  },
                );
              },
            )
          ],
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
