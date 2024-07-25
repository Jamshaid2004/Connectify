import 'package:connectify_project/screens/main%20screens/profile_section/edit%20page/edit_page.dart';

import 'package:connectify_project/utils/constants/user_firestore_doc_constants.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileSectionOverviewWidget extends StatelessWidget {
  const ProfileSectionOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var preferences = GetIt.I.get<SharedPreferences>();
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    var smallTextStyle = TextStyle(fontSize: height * 0.02);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height * 0.3,
        child: Container(
          height: height * 0.2,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Expanded(flex: 8, child: SizedBox()),
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          preferences
                              .getString(UserFirestoreDocConstants.kUsername)!,
                          style: TextStyle(
                              fontSize: height * 0.025, fontFamily: 'Coffee'),
                        ),
                        Text(
                          'Biography',
                          style: smallTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding: WidgetStatePropertyAll(
                                EdgeInsets.all(width * 0.03)),
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.black),
                            shadowColor:
                                const WidgetStatePropertyAll(Colors.grey),
                            visualDensity: VisualDensity.comfortable,
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(width * 0.03))))),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SettingsPage.pageAddress);
                        },
                        child: const FittedBox(
                          child: Text('Edit Profile'),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox())
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Posts', style: smallTextStyle),
                      Text('0', style: smallTextStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Followers', style: smallTextStyle),
                      Text('0', style: smallTextStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Following', style: smallTextStyle),
                      Text('0', style: smallTextStyle),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSectionPostsWidget extends StatelessWidget {
  const ProfileSectionPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: width * 0.01,
        mainAxisSpacing: width * 0.01,
      ),
      itemCount: 21,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          height: height * 0.2,
        );
      },
    );
  }
}

class ProfileSectionImageWidget extends StatelessWidget {
  const ProfileSectionImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width) = MediaQuery.sizeOf(context);
    return Positioned(
      left: width * 0.05,
      top: width * 0.05,
      child:
          CircleAvatar(backgroundColor: Colors.blueGrey, radius: width * 0.14),
    );
  }
}
