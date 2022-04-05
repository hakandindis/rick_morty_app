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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.deepPurple[300],
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            backgroundColor: Colors.deepPurple[300],
            foregroundColor: Colors.white),
      ),
      home: const CharacterPage(),
    );
  }
}
