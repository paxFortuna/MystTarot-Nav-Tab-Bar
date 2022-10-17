import 'package:flutter/material.dart';
import 'package:ui_nft_app/pages/todo_tracker/todo_tracker_page.dart';

import '../pages/todo_simple/todo_simple_page.dart';
import 'components/my_bottombar.dart';
import '../pages/home_page/home_pages.dart';
import '../themes/constants.dart';
import '../utils/glass_box.dart';
import '../pages/habit_tractor/habit_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  // bottom bar navigation
  int _currentBottomIndex = 0;

  void _handleIndexChanged(int? index) {
    setState(() {
      _currentBottomIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: true,
      body: _bodyWidget(),
      bottomNavigationBar: GlassBox(
        child: MyBottomBar(
          index: _currentBottomIndex,
          onTap: _handleIndexChanged,
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    switch (_currentBottomIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const HabitTracerPage();
      case 2:
        return const TodoTrackerPage();
      default:
        return const TodoSimplePage();
    }
  }
}
