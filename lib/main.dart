import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'widgets/bottom_navigation_bar.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff11131b),
        primaryColor: Color(0xff00ffba),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xff1f1f1f),
          tertiary: const Color(0xff11131b),
        ),
      ),
      home: BottomNavigation(),
    );
  }
}
