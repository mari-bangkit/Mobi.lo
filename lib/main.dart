// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/UI/history_page.dart';
import 'package:yuk_mancing/UI/home_page.dart';
import 'package:yuk_mancing/UI/search_page.dart';
import 'package:yuk_mancing/UI/setting_page.dart';
import 'package:yuk_mancing/UI/splash_screen.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:yuk_mancing/providers/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
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
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
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

  Widget _getWidget() {
    if (_selectedItemPosition == 1) {
      return const SearchPage();
    } else if (_selectedItemPosition == 2) {
      return const HistoryPage();
    } else if (_selectedItemPosition == 3) {
      return const SettingPage();
    }

    return HomePage();
  }

  DateTime _timebackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final _difference = DateTime.now().difference(_timebackPressed);
        final _exitwarning = _difference >= Duration(seconds: 2);

        _timebackPressed = DateTime.now();

        if (_exitwarning) {
          const message = 'Press back again to exit';
          Fluttertoast.showToast(
            msg: message,
            fontSize: 18,
            gravity: ToastGravity.BOTTOM,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
        body: _getWidget(),
        bottomNavigationBar: SnakeNavigationBar.color(
          // height: 80,
          backgroundColor: kPrimary,
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: snakeShape = SnakeShape.circle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          padding: EdgeInsets.zero,

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: kSecondary,

          selectedItemColor: kBlack,
          unselectedItemColor: kWhite,

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
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: 'search')
          ],
          selectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
