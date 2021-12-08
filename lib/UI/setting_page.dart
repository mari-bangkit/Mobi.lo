import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/UI/Widget/HomeWidget/username_text.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isFavorit = false;
  var _usernamechange = 'nama belum ditampilkan';
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
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
                        print("on tap");
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _usernamechange,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
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
                      height: 2,
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
                          Radius.circular(10),
                        ),
                      ),
                      child: TextField(
                        controller: _nameChange,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nama lengkap",
                        ),
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: kGray,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Profile telah diubah",
                            gravity: ToastGravity.BOTTOM);
                        setState(() {
                          _usernamechange = _nameChange.text;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Change"),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
