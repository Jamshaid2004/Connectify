import 'package:connectify_project/controller/main%20controllers/sections%20controllers/home%20section%20controller/home%20controller/home_section_bloc.dart';
import 'package:connectify_project/controller/main%20controllers/sections%20controllers/home%20section%20controller/home%20controller/home_section_events.dart';
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
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return HomePagePostWidget(postIndex: index);
      },
    );
  }
}

class HomePagePostWidget extends StatelessWidget {
  final int postIndex;
  const HomePagePostWidget({super.key, required this.postIndex});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeSectionBloc>();
    bool isLiked = false;
    bool postFav = false;
    // all posts will have same isLiked value because the same variable is using while building the list item
    var Size(:height, :width) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(height * 0.005),
      child: SizedBox(
        width: width * 0.7,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKTezalux1__3KwbJ1Bt-WnQQkW82G1Nwy6g&s'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(width * 0.02),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: width * 0.06,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'user name',
                              style: TextStyle(fontSize: width * 0.04),
                            ),
                            Text(
                              'San Fransico',
                              style: TextStyle(fontSize: width * 0.03),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatefulBuilder(
                      builder: (context, setState) {
                        Color favColor = isLiked ? Colors.red : Colors.white;
                        return IconButton(
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                            bloc.add(
                                HomeSectionPostLikeEvent(postId: postIndex));
                          },
                          icon: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.05),
                                color: isLiked
                                    ? Colors.red.withOpacity(0.2)
                                    : null),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: width * 0.02),
                                Icon(
                                  Icons.favorite,
                                  color: favColor,
                                ),
                                SizedBox(width: width * 0.01),
                                const Text('2,326'),
                                SizedBox(width: width * 0.02),
                              ],
                            ),
                          ),
                          iconSize: height * 0.03,
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        bloc.add(
                            HomeSectionPostCommentEvent(postId: postIndex));
                      },
                      icon: Row(
                        children: [
                          const Icon(
                            Icons.mode_comment,
                            color: Colors.white,
                          ),
                          SizedBox(width: width * 0.01),
                          const Text('23'),
                        ],
                      ),
                      iconSize: height * 0.03,
                    ),
                    IconButton(
                      onPressed: () {
                        bloc.add(HomeSectionPostShareEvent(postId: postIndex));
                      },
                      icon: Row(
                        children: [
                          const Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          SizedBox(width: width * 0.01),
                          const Text('23')
                        ],
                      ),
                      iconSize: height * 0.03,
                    ),
                  ],
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          postFav = !postFav;
                        });
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(
                              const SnackBar(content: Text('Save Post')));
                      },
                      icon: Icon(
                        Icons.system_update_tv_outlined,
                        color: postFav ? Colors.white : Colors.grey,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
