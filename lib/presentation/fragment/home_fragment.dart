import 'package:boycott_center/common/icon_constant.dart';
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
            SizedBox(
                height: 180,
                child: _buildBanner()),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 7.5),
              //child: buildExpandablePanel('Trending', buildHorizontalListView(), secondChild: buildHorizontalListView()),
              child: _buildSection(trendingIcon, title: 'Trending', child: buildHorizontalListView()),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 7.5, bottom: 7.5),
              child: _buildSection(justStartedIcon, title: 'Just Started', child: buildHorizontalListView()),
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 15, right: 15, top: 7.5, bottom: 7.5),
            //   child: _buildSection(title: 'Trending', child: buildHorizontalListView()),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget buildHorizontalListView() {
  //   return Container(
  //     height: 150,
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: 10,
  //       itemBuilder: (context, index) {
  //         return Card(
  //           child: Container(
  //             width: 150,
  //             child: Center(
  //               child: Text('Item $index'),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget buildHorizontalListView() {
    return Container(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.asset(flagIcon, height: 100, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.grey),
                            SizedBox(width: 5),
                            Text('Some Name'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Boycott Puma',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.grey),
                            SizedBox(width: 5),
                            Text('100'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('BOYCOTT'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBanner() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('CEASEFIRE IN',
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              Text('GAZA',
                  style: TextStyle(color: Colors.white, fontSize: 22)),
              Text('NOW',
                  style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        // You can also add other Positioned widgets for more graphics or text on the banner
      ],
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

  Widget _buildSection(String icon, {required String title, required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(icon),
              const SizedBox(width: 10,),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const Spacer(),
              const Text(
                'See All',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(height: 10), // Add a gap between title and list
          child,
        ],
      ),
    );
  }
}
