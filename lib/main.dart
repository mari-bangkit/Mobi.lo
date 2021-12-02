// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_mancing/UI/history_page.dart';
import 'package:yuk_mancing/UI/home_page.dart';
import 'package:yuk_mancing/UI/search_page.dart';
import 'package:yuk_mancing/UI/setting_page.dart';
import 'package:yuk_mancing/UI/splash_screen.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;
  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);

  Color unselectedColor = Colors.grey;
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFEEEEE).withOpacity(0),
    const Color(0xFFE4EDF5).withOpacity(0),
    const Color(0xFFE7EEED).withOpacity(0),
    const Color(0xFFF4E4CE).withOpacity(0),
  ];

  get kPrimary => null;

  Widget _getWidget() {
    if (_selectedItemPosition == 1) {
      return const SearchPage();
    } else if (_selectedItemPosition == 2) {
      return const HistoryPage();
    } else if (_selectedItemPosition == 3) {
      return const SettingPage();
    }

    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: _getWidget(),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: snakeShape = SnakeShape.circle,
        shape: bottomBarShape,
        padding: EdgeInsets.zero,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: kPrimary,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showSelectedLabels: showSelectedLabels = false,
        showUnselectedLabels: showUnselectedLabels = false,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: 'search')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
