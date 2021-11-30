import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("Assets/Images/SplashScreen.png"),
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
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  child: const Text(
                    "Jika engkau menginginkan kebahagiaan selama satu hari, pergilah memancing.",
                    style: TextStyle(
                      fontFamily: "Monsterat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
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
                          builder: (context) =>
                              const MyHomePage(title: "flutter capstone"),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      minimumSize:
                          Size.fromWidth(MediaQuery.of(context).size.width / 3),
                      primary: kBlack,
                      backgroundColor: kSecondary,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    child: const Text(
                      'Get started',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: kBlack,
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
