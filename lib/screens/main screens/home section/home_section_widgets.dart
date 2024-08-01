import 'package:connectify_project/controller/main%20controllers/home%20sections%20controllers/home%20section%20controller/home%20controller/home_section_controller.dart';
import 'package:connectify_project/controller/main%20controllers/home%20sections%20controllers/home%20section%20controller/home%20controller/home_section_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSectionAppBarWidget extends StatelessWidget {
  const HomeSectionAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:height) = MediaQuery.sizeOf(context);
    final bloc = context.read<HomeSectionBloc>();
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
            bloc.add(HomeSectionNotificationClickEvent(context: context));
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
    final bloc = context.read<HomeSectionBloc>();
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
                  bloc.add(HomeSectionStoryClickEvent(username: 'name $index'));
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
    final bloc = context.read<HomeSectionBloc>();
    bool isLiked = false;
    // all posts will have same isLiked value because the same variable is using while building the list item
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
                          StatefulBuilder(builder: (context, setState) {
                            Color favColor =
                                isLiked ? Colors.red : Colors.white;
                            return IconButton(
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                                bloc.add(
                                    HomeSectionPostLikeEvent(postId: index));
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: favColor,
                              ),
                              iconSize: height * 0.03,
                            );
                          }),
                          IconButton(
                            onPressed: () {
                              bloc.add(
                                  HomeSectionPostCommentEvent(postId: index));
                            },
                            icon: const Icon(
                              Icons.mode_comment,
                              color: Colors.white,
                            ),
                            iconSize: height * 0.03,
                          ),
                          IconButton(
                            onPressed: () {
                              bloc.add(
                                  HomeSectionPostShareEvent(postId: index));
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            iconSize: height * 0.03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
