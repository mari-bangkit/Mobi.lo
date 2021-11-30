import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yuk_mancing/Constant/style.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 15,
                      ),
                      height: 50,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/Images/Logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Brother,",
                            style: TextStyle(
                              fontFamily: "Gothic A1",
                              fontSize: 35,
                              color: kPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Welcome back",
                            style: TextStyle(
                              fontFamily: "Gothic A1",
                              fontSize: 30,
                              color: kBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: kLightGray.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email or Phone number"),
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: kGray,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: kLightGray.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: TextField(
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(_isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                              ),
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: kGray,
                              ),
                            ),
                          ),
                          Container(
                            height: 23,
                            margin: const EdgeInsets.only(right: 20, top: 3),
                            alignment: Alignment.bottomRight,
                            child: const Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  fontFamily: "Monstserrat",
                                  fontSize: 15,
                                  color: kLightGray,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
