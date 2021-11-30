import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("Assets/Images/SplashScreen"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                kBlack.withOpacity(0.8),
                BlendMode.darken,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
