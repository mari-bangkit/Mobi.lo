import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/username.dart';
import 'package:yuk_mancing/UI/login_page.dart';
import 'package:yuk_mancing/providers/auth.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isFavorit = false;

  Duration get changeTime => const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 15,
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kBlack.withOpacity(0.5),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavorit = !_isFavorit;
                      });
                    },
                    icon: Icon(_isFavorit
                        ? CupertinoIcons.bell
                        : CupertinoIcons.bell_fill),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account settings",
                    style: TextStyle(
                      fontFamily: "Mon",
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showsimpledialog(context);
                    },
                    child: Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: kLightGray.withOpacity(0.3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 18,
                            color: kBlack.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Loginpage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: kLightred.withOpacity(0.4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 18,
                            color: kLightred,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showsimpledialog(BuildContext context) {
    TextEditingController _nameChange = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          title: const Text(
            "Edit profile",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          titlePadding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama lengkap",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Montserrat"),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 5),
                    child: TextField(
                      controller: _nameChange,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: 'ubah nama anda'),
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: kGray,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        name = _nameChange.text;
                        Future.delayed(changeTime).then((value) async {
                          String message = "in";
                          try {
                            await Provider.of<Auth>(context, listen: false)
                                .update(name);
                          } catch (e) {
                            message = e.toString();
                            return message;
                          } finally {
                            if (message != "in") {
                              Fluttertoast.showToast(
                                msg: message.toString(),
                                fontSize: 18,
                                gravity: ToastGravity.BOTTOM,
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Profile telah diubah",
                                  gravity: ToastGravity.BOTTOM);
                              setState(() {});
                              Navigator.of(context).pop();
                            }
                          }
                        });
                      },
                      child: const Text("Change"),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
