// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mission_k3_web/Models/content_view.dart';
import 'package:mission_k3_web/Models/tab_controller_handler.dart';
import 'package:mission_k3_web/views/upload_view.dart';
import 'package:mission_k3_web/views/home_view.dart';
// import 'package:mission_k3_web/widgets/bottom_bar.dart';
import 'package:mission_k3_web/widgets/custom_tab.dart';
import 'package:mission_k3_web/widgets/custom_tab_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late double sidePadding;

  List<ContentView> contentViews = [
    ContentView(
      tab: const CustomTab(title: 'Home'),
      content: const HomeView(),
    ),
    ContentView(
      tab: const CustomTab(title: 'Upload'),
      content: const MemberView(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.03;
    sidePadding = screenWidth * 0.05;

    print('Width: $screenWidth');
    print('Height: $screenHeight');
    return Scaffold(
      backgroundColor: const Color(0xff1e1e24),
      key: scaffoldKey,
      endDrawer: drawer(),
      body: Center(
        child: SizedBox(
          width: screenWidth < 1000 ? screenWidth * 0.95 : screenWidth * 0.4,
          child: Padding(
            padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Tab Bar
                SizedBox(
                  height: screenHeight * 0.05,
                  width: screenWidth < 1000
                      ? screenWidth * 0.95
                      : screenWidth * 0.4,
                  child: CustomTabBar(
                      controller: tabController,
                      tabs: contentViews.map((e) => e.tab).toList()),
                ),

                /// Tab Bar View
                SizedBox(
                  height: screenHeight * 0.8,
                  child: TabControllerHandler(
                    tabController: tabController,
                    child: Center(
                      child: SizedBox(
                        width: screenWidth * 0.90,
                        child: TabBarView(
                          controller: tabController,
                          children: contentViews.map((e) => e.content).toList(),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Bottom Bar
                // BottomBar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawer() {
    return SizedBox(
      width: screenWidth * 0.5,
      child: Drawer(
        child: ListView(
          children: [Container(height: screenHeight * 0.1)] +
              contentViews
                  .map((e) => Container(
                        child: ListTile(
                          title: Text(
                            e.tab.title,
                            style: Theme.of(context).textTheme.button,
                          ),
                          onTap: () {
                            itemScrollController.scrollTo(
                                index: contentViews.indexOf(e),
                                duration: const Duration(milliseconds: 300));
                            Navigator.pop(context);
                          },
                        ),
                      ))
                  .toList(),
        ),
      ),
    );
  }
}
