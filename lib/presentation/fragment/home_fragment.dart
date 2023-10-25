import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 7.5),
              child: buildExpandablePanel('Trending', buildHorizontalListView(), secondChild: buildHorizontalListView()),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 7.5, bottom: 7.5),
              child: buildExpandablePanel('New', buildHorizontalListView(), secondChild: buildHorizontalListView()),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 7.5, bottom: 7.5),
              child: buildExpandablePanel('My Boycott', buildVerticalListView()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHorizontalListView() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              width: 150,
              child: Center(
                child: Text('Item $index'),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildVerticalListView() {
    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }

  ExpandablePanel buildExpandablePanel(String title, Widget child, {Widget? secondChild}) {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      collapsed: Container(),
      expanded: Column(
        children: [
          child,
          if (secondChild != null) secondChild,
        ],
      ),
    );
  }
}
