// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/UI/forgotpass_page.dart';
import 'package:yuk_mancing/UI/signup_page.dart';
import 'package:yuk_mancing/main.dart';
import 'package:yuk_mancing/providers/auth.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  bool _isObscure = true;
  bool _validateUsername = false;
  bool _validatePassword = false;
  bool _isloading = false;

  var _username;
  var _passwordUser;

  Duration get loginTime => const Duration(milliseconds: 3000);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DateTime _timebackPressed = DateTime.now();

    return WillPopScope(
      onWillPop: () async {
        final _difference = DateTime.now().difference(_timebackPressed);
        final _exitwarning = _difference >= const Duration(seconds: 2);

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
        backgroundColor: kWhite,
        body: SafeArea(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 200),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          right: 10,
                        ),
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("Assets/Images/Logo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInDown(
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 800),
                            child: RichText(
                              text: const TextSpan(
                                text: "Brother,\n",
                                style: TextStyle(
                                  fontFamily: "Gothic A1",
                                  fontSize: 35,
                                  color: kPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Welcome back",
                                    style: TextStyle(
                                      fontFamily: "Gothic A1",
                                      fontSize: 35,
                                      color: kBlack,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          FadeInLeft(
                            delay: const Duration(milliseconds: 300),
                            duration: const Duration(milliseconds: 800),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextField(
                                controller: _usernameController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    errorText: _validateUsername
                                        ? "Email Can't empty"
                                        : null,
                                    hintText: "Email"),
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: kGray,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeInLeft(
                            delay: const Duration(milliseconds: 500),
                            duration: const Duration(milliseconds: 800),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextField(
                                obscureText: _isObscure,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  errorText: _validatePassword
                                      ? "Paswords Can't empty"
                                      : null,
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
                          ),
                          FadeInLeft(
                            delay: const Duration(milliseconds: 400),
                            duration: const Duration(milliseconds: 800),
                            child: Container(
                              height: 40,
                              margin: const EdgeInsets.only(right: 15, top: 3),
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  primary: kWhite,
                                ),
                                onPressed: () {
                                  print("dialihkan ke forgot password");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ForgotPass(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Forgot Password ?",
                                  style: TextStyle(
                                      fontFamily: "Monstserrat",
                                      fontSize: 15,
                                      color: kLightGray,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 400),
                            duration: const Duration(milliseconds: 800),
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 20,
                              ),
                              padding: const EdgeInsets.all(2),
                              height: 45,
                              width: MediaQuery.of(context).size.height,
                              child: TextButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      if (_usernameController.text.isEmpty &&
                                          _passwordController.text.isNotEmpty) {
                                        _validateUsername = true;
                                      } else if (_usernameController
                                              .text.isNotEmpty &&
                                          _passwordController.text.isEmpty) {
                                        _validatePassword = true;
                                      } else if (_passwordController
                                              .text.isEmpty &&
                                          _usernameController.text.isEmpty) {
                                        _validatePassword = true;
                                        _validateUsername = true;
                                      } else {
                                        _validatePassword = false;
                                        _validateUsername = false;

                                        _username = _usernameController.text;
                                        _passwordUser =
                                            _passwordController.text;
                                        setState(() {
                                          _isloading = true;
                                        });
                                        Future.delayed(loginTime)
                                            .then((value) async {
                                          String message = "in";
                                          try {
                                            await Provider.of<Auth>(context,
                                                    listen: false)
                                                .login(
                                                    _username, _passwordUser);
                                          } catch (e) {
                                            message = e.toString();
                                            return message;
                                          } finally {
                                            setState(() {
                                              _isloading = false;
                                            });
                                            if (message != "in") {
                                              Fluttertoast.showToast(
                                                msg: message.toString(),
                                                fontSize: 18,
                                                gravity: ToastGravity.BOTTOM,
                                              );
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MyHomePage(),
                                                ),
                                              );
                                            }
                                          }
                                        });
                                      }
                                    },
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(5),
                                  minimumSize: Size.fromWidth(
                                      MediaQuery.of(context).size.width / 3),
                                  primary: kBlack,
                                  backgroundColor: kSecondary,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ),
                                child: _isloading
                                    ? const SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                          color: kWhite,
                                          backgroundColor: kBlack,
                                        ),
                                      )
                                    : const Text(
                                        'Login',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: kBlack,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 400),
                            duration: const Duration(milliseconds: 800),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don’t have acount ?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kLightGray,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  alignment: Alignment.topCenter,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: kWhite,
                                    ),
                                    onPressed: () {
                                      print("dialihkan ke create account");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignUp(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Sign up",
                                      style: TextStyle(
                                          fontFamily: "Monstserrat",
                                          fontSize: 15,
                                          color: kBlack,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
