import 'package:connectify_project/screens/login_screen.dart';
import 'package:connectify_project/utils/constants/shared_preferences_constant.dart';
import 'package:connectify_project/utils/constants/sign_in_method_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});
  static const sectionAddress = '/profileSection';

  @override
  Widget build(BuildContext context) {
    var preferences = GetIt.I.get<SharedPreferences>();
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: height * 0.15,
            pinned: true,
            expandedHeight: height * 0.3,
            collapsedHeight: height * 0.15,
            automaticallyImplyLeading: false,
            flexibleSpace: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.red)),
            title: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue)),
            actions: [
              GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    if (preferences.getString(
                            SharedPreferencesConstant.signInMethod) ==
                        SignInMethod.signInByGoogle) {
                      await GoogleSignIn().signOut();
                    }
                    if (context.mounted) {
                      Navigator.of(context)
                          .popAndPushNamed(LoginPage.pageAddress);
                    }
                  },
                  child: const Icon(Icons.logout)),
            ],

            // title: Center(
            //   child: Stack(
            //     alignment: Alignment.centerLeft,
            //     children: [
            //       Column(
            //         children: [
            //           Container(
            //             color: Colors.blue,
            //             height: height * 0.08,
            //             width: width,
            //           ),
            //           SizedBox(height: height * 0.7)
            //         ],
            //       ),
            //       SizedBox(
            //         child: CircleAvatar(
            //           radius: height * 0.06,
            //           backgroundColor: Colors.blueGrey,
            //         ),
            //       ),
            //       // Row(
            //       //   children: [
            //       //     CircleAvatar(
            //       //       backgroundColor: Colors.white,
            //       //       radius: width * 0.08,
            //       //     ),
            //       //   ],
            //       // ),
            //     ],
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.grey,
            ),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 100, color: Colors.white),
              );
            },
          ),
        ],
      ),
    );
  }
}


/// logout button click method
// () async {
//                   await FirebaseAuth.instance.signOut();
//                   if (preferences
//                           .getString(SharedPreferencesConstant.signInMethod) ==
//                       SignInMethod.signInByGoogle) {
//                     await GoogleSignIn().signOut();
//                   }
//                   if (context.mounted) {
//                     Navigator.of(context)
//                         .popAndPushNamed(LoginPage.pageAddress);
//                   }
//                 },
