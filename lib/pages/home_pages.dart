import 'package:flutter/material.dart';
import 'package:ui_nft_app/components/my_abbbar.dart';
import 'package:ui_nft_app/components/my_tabbar.dart';
import 'package:ui_nft_app/themes/constants.dart';

import '../tabs/recent_tab.dart';
import '../tabs/top_tab.dart';
import '../tabs/trending_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // tab options
  List tabOption = [
    ["Recent", const RecentTab()],
    ["Trending", const TrendingTab()],
    ["Top", const TopTab()],
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        body: ListView(
          children: [
            //title + search button
            MyAbbBar(
              title: 'MYST TAROT',
              onSearchTap: searchButtonTapped,
            ),
            // tab bar
            SizedBox(
              height: 600,
                child: MyTabBar(
                  tabOptions: tabOption,
                ),
            )
          ],
        ),
      ),
    );
  }

  void searchButtonTapped() {}
}
