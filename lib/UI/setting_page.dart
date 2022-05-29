import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/username.dart';
import 'package:yuk_mancing/UI/login_page.dart';
import 'package:yuk_mancing/providers/auth.dart';

import '../providers/place_data.dart';
import 'Widget/SettingWidget/profile_menu_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isFavorit = false;
  String name = '';
  final emailController = TextEditingController(text: '');

  Duration get changeTime => const Duration(milliseconds: 200);

  @override
  void didChangeDependencies() {
    name = Provider.of<Placesdata>(context).name;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: kWhiteGreyColor,
          padding: const EdgeInsets.only(
            top: 25,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 24,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 22,
                        ),
                        Text(
                          "Hi, $name",
                          style: blackTextStyle.copyWith(
                            fontSize: 30,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(36),
                  ),
                  color: kWhiteColor,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showsimpledialog(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Edit Profile",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.chevron_right,
                              color: kBlackColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ProfileMenuItem(
                      title: 'Frequently Asked Questions',
                    ),
                    GestureDetector(
                      onTap: () {
                        _showsimpledialog(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Customer Care',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.chevron_right,
                              color: kBlackColor,
                            ),
                          ],
                        ),
                      ),
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
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Log Out",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kLightred,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.chevron_right,
                            color: kLightred,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Text(
              //       "Account settings",
              //       style: TextStyle(
              //         fontFamily: "Mon",
              //         fontSize: 20,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 5,
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         _showsimpledialog(context);
              //       },
              //       child: Container(
              //         height: 48,
              //         width: MediaQuery.of(context).size.width,
              //         margin: const EdgeInsets.only(right: 10),
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 10,
              //         ),
              //         decoration: BoxDecoration(
              //           color: kLightGray.withOpacity(0.3),
              //           borderRadius: const BorderRadius.all(
              //             Radius.circular(10),
              //           ),
              //         ),
              //         child: Align(
              //           alignment: Alignment.centerLeft,
              //           child: Text(
              //             "Edit Profile",
              //             style: TextStyle(
              //               fontSize: 18,
              //               color: kBlack.withOpacity(0.6),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //     const SizedBox(
              //       height: 15,
              //     ),
              //     const SizedBox(
              //       height: 30,
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const Loginpage(),
              //           ),
              //         );
              //       },
              //       child: Container(
              //         height: 48,
              //         width: MediaQuery.of(context).size.width,
              //         margin: const EdgeInsets.only(right: 10),
              //         padding: const EdgeInsets.symmetric(
              //           horizontal: 10,
              //         ),
              //         decoration: BoxDecoration(
              //           color: kLightred.withOpacity(0.4),
              //           borderRadius: const BorderRadius.all(
              //             Radius.circular(10),
              //           ),
              //         ),
              //         child: const Align(
              //           alignment: Alignment.centerLeft,
              //           child: Text(
              //             "Log Out",
              //             style: TextStyle(
              //               fontSize: 18,
              //               color: kLightred,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // )
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
          title: Text(
            "Edit profile",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
          titlePadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama lengkap",
                    style: blackTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 80,
                    margin: const EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: _nameChange,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'ubah nama anda',
                      ),
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: kWhiteGreyColor,
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
                        Future.delayed(changeTime).then(
                          (value) async {
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
                          },
                        );
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
