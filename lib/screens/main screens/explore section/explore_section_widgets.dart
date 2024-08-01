import 'package:flutter/material.dart';

class ExploreSectionOddIndexWidget extends StatelessWidget {
  const ExploreSectionOddIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:width, :height) = MediaQuery.sizeOf(context);
    return SizedBox(
      width: width,
      height: height * 0.4,
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container(color: Colors.blue)),
              Expanded(child: Container(color: Colors.pink)),
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container(color: Colors.green)),
              Expanded(child: Container(color: Colors.purple)),
            ],
          )),
          Expanded(child: Container(color: Colors.red))
        ],
      ),
    );
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
          Expanded(child: Container(color: Colors.redAccent)),
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container(color: Colors.greenAccent)),
              Expanded(child: Container(color: Colors.purpleAccent)),
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container(color: Colors.blueAccent)),
              Expanded(child: Container(color: Colors.pinkAccent)),
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
