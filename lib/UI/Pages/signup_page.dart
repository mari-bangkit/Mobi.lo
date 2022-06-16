import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../Constant/style.dart';
import '../../Repository/Api/providers/auth.dart';
import '../Widget/GlobalWidget/appbar_costum.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Duration get loginTime => const Duration(milliseconds: 200);

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _isObscure = true;
  String errorText = '';
  bool _passmatch = false;
  bool _isloading = false;

  // late Userdata data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          child: ListView(
            children: [
              const AppbarCostum(
                leftIcon: Icons.arrow_back,
                nameappbar: "Create Account",
                leftCallback: Loginpage(),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Email",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat"),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2),
                      ),
                      // errorText: _validateUsername ? "Email Can't empty" : null,
                      hintText: "Email"),
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: kGray,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Create password",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat"),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  obscureText: _isObscure,
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // errorText:
                    //     _validatePassword ? "Paswords Can't empty" : null,
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Confirm password",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat"),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorText:
                        _passmatch == true ? "Password tidak sama" : null,
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    if (value != _passwordcontroller.text) {
                      _passmatch = true;
                    } else {
                      _passmatch = false;
                    }
                  },
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: kGray,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: _passmatch == false
                      ? () {
                          var email = _emailcontroller.text;
                          var passworrd = _passwordcontroller.text;
                          setState(() {
                            _isloading = true;
                          });
                          Future.delayed(loginTime).then((value) async {
                            String message = "in";
                            try {
                              await Provider.of<Auth>(context, listen: false)
                                  .signup(email, passworrd);
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
                                var msg = "akun telah ditambahkan";
                                Fluttertoast.showToast(
                                  msg: msg.toString(),
                                  fontSize: 18,
                                  gravity: ToastGravity.BOTTOM,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Loginpage(),
                                  ),
                                );
                              }
                            }
                          });
                        }
                      : null,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    minimumSize:
                        Size.fromWidth(MediaQuery.of(context).size.width / 3),
                    primary: kBlack,
                    backgroundColor:
                        _passmatch == true ? kLightGray : kSecondary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Create account',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kBlack,
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
