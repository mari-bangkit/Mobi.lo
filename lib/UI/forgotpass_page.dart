import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Repository/Api/providers/auth.dart';
import 'package:yuk_mancing/UI/Widget/GlobalWidget/appbar_costum.dart';
import 'package:yuk_mancing/UI/login_page.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  Duration get forgotpassTime => const Duration(milliseconds: 500);

  final TextEditingController myController = TextEditingController();

  bool _validateUsername = false;
  bool _isloading = false;
  var _email;

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
                nameappbar: "Forgot Password",
                leftCallback: Loginpage(),
              ),
              const SizedBox(
                height: 100,
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
                  controller: myController,
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
                      errorText: _validateUsername ? "Email Can't empty" : null,
                      hintText: "Email"),
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: kGray,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(2),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      if (myController.text.isEmpty) {
                        _validateUsername = true;
                      } else {
                        _validateUsername = false;
                        _email = myController.text;

                        Future.delayed(forgotpassTime).then((value) async {
                          String message = "in";
                          try {
                            await Provider.of<Auth>(context, listen: false)
                                .forgotpass(_email);
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
                              String msg =
                                  "link forgot password telah dikirim ke email";
                              Fluttertoast.showToast(
                                msg: msg,
                                fontSize: 18,
                                gravity: ToastGravity.CENTER,
                              );
                            }
                          }
                        });
                      }
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    minimumSize:
                        Size.fromWidth(MediaQuery.of(context).size.width / 3),
                    primary: kBlack,
                    backgroundColor: kSecondary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: kBlack,
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(top: 2),
                alignment: Alignment.center,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: kWhite,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Loginpage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Back to login",
                    style: TextStyle(
                        fontFamily: "Monstserrat",
                        fontSize: 15,
                        color: kLightGray,
                        fontWeight: FontWeight.w600),
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
