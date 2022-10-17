import 'package:flutter/material.dart';
import 'package:ui_nft_app/pages/home_pages.dart';

void main() {
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
      home: const HomePage(),
    );
  }
}
