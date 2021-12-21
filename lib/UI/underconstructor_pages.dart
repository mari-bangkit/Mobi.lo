import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yuk_mancing/Constant/style.dart';

class UnderConstructor extends StatelessWidget {
  const UnderConstructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
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
                height: 5,
              ),
              const Text(
                "Oops Page not found ",
                style: TextStyle(
                  fontSize: 25,
                  color: kWhite,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "We a sorry, this page under construtor ",
                style: TextStyle(
                  fontSize: 15,
                  color: kWhite,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(top: 18, bottom: 18),
                    primary: Colors.black26,
                    backgroundColor: kSecondary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Go back",
                    style: TextStyle(
                      color: kBlack,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
