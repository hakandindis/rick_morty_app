// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rick_morty_app/feature/character/view/character_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0, backgroundColor: Colors.blue,foregroundColor: Colors.white),
      ),
      home: const CharacterPage(),
    );
  }
}
