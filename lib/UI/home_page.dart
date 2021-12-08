import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:yuk_mancing/UI/Widget/HomeWidget/category_widget.dart';
import 'package:yuk_mancing/UI/Widget/HomeWidget/list_place.dart';
import 'package:yuk_mancing/UI/Widget/HomeWidget/username_text.dart';
import 'package:yuk_mancing/UI/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFavorit = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            right: 15,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    height: 45,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("Assets/Images/Logo.png"),
                        fit: BoxFit.cover,
                      ),
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
                height: 20,
              ),
              const UsernameText(),
              const Category(),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailsPage(),
                          ),
                        );
                      },
                      child: const ListPlace(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
