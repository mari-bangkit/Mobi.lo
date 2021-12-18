import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yuk_mancing/Constant/style.dart';

class UnderConstructor extends StatelessWidget {
  const UnderConstructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Lottie.asset('Assets/Images/underconstruction-1.json'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Oops Page not found ",
                style: TextStyle(
                  fontSize: 25,
                  color: kWhite,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "We a sorry, this page under construtor ",
                style: TextStyle(
                  fontSize: 15,
                  color: kWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
