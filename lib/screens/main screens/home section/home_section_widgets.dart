import 'package:connectify_project/screens/main%20screens/home%20section/notification%20page/notification_page.dart';
import 'package:connectify_project/screens/main%20screens/home%20section/story%20page/story_page.dart';
import 'package:flutter/material.dart';

class HomeSectionAppBarWidget extends StatelessWidget {
  const HomeSectionAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:height) = MediaQuery.sizeOf(context);
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: true,
      title: Text(
        'Connectify',
        style: ThemeData.dark()
            .textTheme
            .titleLarge!
            .copyWith(fontSize: height * 0.04, fontFamily: 'Coffee'),
      ),
      actions: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
              ..clearSnackBars()
              ..showSnackBar(
                  const SnackBar(content: Text('notification page clicked')));
            Navigator.of(context).pushNamed(NotificationPage.pageAddress);
          },
          icon: Padding(
            padding: EdgeInsets.all(height * 0.01),
            child: Icon(
              Icons.notifications,
              size: height * 0.04,
            ),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}

class HomeSectionStoriesWidget extends StatelessWidget {
  const HomeSectionStoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:height) = MediaQuery.sizeOf(context);
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height * 0.15,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(height * 0.005),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return StoryPage(username: 'name $index');
                      },
                    ),
                  );
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: height * 0.05,
                      backgroundColor: Colors.white,
                    ),
                    Text('name $index'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeSectionPostsWidget extends StatelessWidget {
  const HomeSectionPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(height * 0.005),
          child: SizedBox(
            width: width * 0.7,
            height: width,
            child: Stack(
              children: [
                Container(
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: width * 0.06,
                      ),
                    ),
                    Text(
                      'user name',
                      style: TextStyle(fontSize: width * 0.045),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: width,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.favorite,
                            size: height * 0.03,
                          ),
                          Icon(
                            Icons.mode_comment,
                            size: height * 0.03,
                          ),
                          Icon(
                            Icons.share,
                            size: height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
