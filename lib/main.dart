import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ui_nft_app/root/app_page.dart';

void main() async {

  // initialize hive
  await Hive.initFlutter();

  // open todo_habit_tracker box
  await Hive.openBox('Habit_Database');

  // open todo_simple box
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.lime,
      ),
      home: const AppPage(),
    );
  }
}
