import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/players.dart';
import 'package:yuk_mancing/Repository/Api/providers/auth.dart';
import 'package:yuk_mancing/Repository/Api/providers/place_data.dart';
import 'package:yuk_mancing/Repository/Api/providers/player.dart';
import 'package:yuk_mancing/UI/Pages/login_page.dart';
import 'package:yuk_mancing/UI/Widget/SettingWidget/profile_menu_item.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isFavorit = false;
  String name = '';
  String email = '';
  var selectedGender;
  late List<String> gender;
  final emailController = TextEditingController(text: '');

  Duration get changeTime => const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    gender = ["Laki-Laki", "Perempuan"];
  }

  @override
  void didChangeDependencies() {
    name = Provider.of<Placesdata>(context).name;
    email = Provider.of<Placesdata>(context).dataEmail;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: kWhiteGreyColor,
        padding: const EdgeInsets.only(
          top: 25,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
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
                        bottom: 20,
                      ),
                      height: 30,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Edit Profile",
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: bold,
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
                  const ProfileMenuItem(
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
                      _showdeletedialog(context);
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
          ],
        ),
      ),
    );
  }

  void _showsimpledialog(BuildContext context) {
    TextEditingController _nameChange = TextEditingController();

    TextEditingController _countryChange = TextEditingController();
    TextEditingController _genderChange = TextEditingController();
    TextEditingController _ageChange = TextEditingController();

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
                        hintText: 'cth: Jhond Smith',
                      ),
                      style: blackAccentTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email",
                    style: blackTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 30,
                    margin: const EdgeInsets.only(
                      right: 15,
                      left: 15,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      email,
                      style: blackAccentTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  Text(
                    "Negara",
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
                      controller: _countryChange,
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
                        hintText: 'cth: Amerika',
                      ),
                      style: blackAccentTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Gender",
                    style: blackTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kBlack),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(10),
                        hint: Text(
                          "Gender",
                          style: blackAccentTextStyle,
                        ),
                        items: gender.map((value) {
                          return DropdownMenuItem(
                            child: Text(
                              value,
                              style: blackTextStyle,
                            ),
                            value: value,
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == "Laki-Laki") {
                            setState(() {
                              selectedGender = 0;
                            });
                          } else {
                            setState(() {
                              selectedGender = 1;
                            });
                          }
                        },
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Umur",
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
                      controller: _ageChange,
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
                        hintText: 'cth: 20',
                      ),
                      style: blackAccentTextStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () {
                          name = _nameChange.text;
                          if (_nameChange.text == '') {
                            name = "User";
                          }
                          int age = int.parse(_ageChange.text);
                          String country = _countryChange.text;
                          String customerEMail = email;
                          String customerName = _nameChange.text;
                          String gender = _genderChange.text;
                          Future.delayed(changeTime).then(
                            (value) async {
                              String message = "in";
                              try {
                                await Provider.of<Auth>(context, listen: false)
                                    .update(name);
                                await Provider.of<PlayersProviders>(context,
                                        listen: false)
                                    .addPlayer(
                                  age,
                                  country,
                                  customerEMail,
                                  customerName,
                                  gender,
                                );
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
                        child: Text(
                          "Change",
                          style: blackTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
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

  void _showdeletedialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Do you want to exit?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('yes selected');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Loginpage(),
                              ),
                            );
                          },
                          child: const Text("Yes"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red.shade800),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('no selected');
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}