import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../Constant/style.dart';
import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("Assets/Images/cars.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                kBlack.withOpacity(0.4),
                BlendMode.darken,
              ),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  child: FadeInDown(
                    delay: const Duration(milliseconds: 100),
                    duration: const Duration(milliseconds: 800),
                    child: const Text(
                      "Carilah mobil impian mu dan berkendaralah dengannya.",
                      style: TextStyle(
                        fontFamily: "Monstserrat",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: kWhite,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FadeInRight(
                  duration: const Duration(milliseconds: 900),
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 25,
                      right: 20,
                    ),
                    padding: const EdgeInsets.all(2),
                    height: 65,
                    width: 181,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loginpage(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(10),
                        minimumSize: Size.fromWidth(
                            MediaQuery.of(context).size.width / 3),
                        primary: kBlack,
                        backgroundColor: kPrimary,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text(
                        'Get started',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: kBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
