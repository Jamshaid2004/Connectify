import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExploreSectionOddIndexWidget extends StatelessWidget {
  const ExploreSectionOddIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width,
      height: height * 0.35,
      child: Row(
        children: [
          Expanded(
            flex: 100,
            child: Column(
              children: [
                Expanded(flex: 100, child: ExplorePageItem(color: Colors.blue)),
                const Spacer(),
                Expanded(flex: 100, child: ExplorePageItem(color: Colors.pink)),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 100,
            child: Column(
              children: [
                Expanded(
                    flex: 100, child: ExplorePageItem(color: Colors.green)),
                const Spacer(),
                Expanded(
                    flex: 100, child: ExplorePageItem(color: Colors.purple)),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 100,
            child: Column(
              children: [
                Expanded(flex: 201, child: ExplorePageItem(color: Colors.red)),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShimmerLoadingEffect extends StatelessWidget {
  final double? width;
  final double? height;
  const ShimmerLoadingEffect({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: (height == null) ? null : (height! * 0.35),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ExplorePageItem extends StatelessWidget {
  final Color color;
  ExplorePageItem({super.key, required this.color});

  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return isLoaded
          ? Container(color: color)
          : GestureDetector(
              onTap: () {
                setState(() {
                  isLoaded = true;
                });
              },
              child: const ShimmerLoadingEffect());
    });
  }
}

class ExploreSectionEvenIndexWidget extends StatelessWidget {
  const ExploreSectionEvenIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width,
      height: height * 0.4,
      child: Row(
        children: [
          Expanded(
            flex: 100,
            child: Column(
              children: [
                Expanded(
                    flex: 201, child: ExplorePageItem(color: Colors.redAccent)),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
              flex: 100,
              child: Column(
                children: [
                  Expanded(
                      flex: 100,
                      child: ExplorePageItem(color: Colors.greenAccent)),
                  const Spacer(),
                  Expanded(
                      flex: 100,
                      child: ExplorePageItem(color: Colors.purpleAccent)),
                  const Spacer(),
                ],
              )),
          const Spacer(),
          Expanded(
              flex: 100,
              child: Column(
                children: [
                  Expanded(
                      flex: 100,
                      child: ExplorePageItem(color: Colors.blueAccent)),
                  const Spacer(),
                  Expanded(
                      flex: 100,
                      child: ExplorePageItem(color: Colors.pinkAccent)),
                  const Spacer(),
                ],
              )),
        ],
      ),
    );
  }
}

class ExploreSectionSearchBarWidget extends StatelessWidget {
  const ExploreSectionSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: width * 0.05),
      child: SizedBox(
        width: width * 0.9,
        height: height * 0.06,
        child: SearchBar(
          backgroundColor: const WidgetStatePropertyAll(Colors.black),
          trailing: Iterable.generate(
            1,
            (index) {
              return IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              );
            },
          ),
        ),
      ),
    );
  }
}
