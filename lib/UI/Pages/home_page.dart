import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/category.dart';
import 'package:yuk_mancing/Repository/Api/providers/aI_prediction_api.dart';
import 'package:yuk_mancing/Repository/Api/providers/place_data.dart';

import 'package:yuk_mancing/UI/Widget/HomeWidget/list_place.dart';
import 'package:yuk_mancing/UI/Widget/HomeWidget/username_text.dart';
import 'package:yuk_mancing/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  bool _isFavorit = true;
  bool isInit = true;
  bool _isloading = true;
  bool _isSameName = false;

  Widget _showwidget = const CircularProgressIndicator();

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<Placesdata>(context).getdataplace();
      setState(() {
        _isloading = false;
      });
    }
    isInit = false;
    startTimer();
    super.didChangeDependencies();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (_isSameName == true) {
      _showAlert(context);
    }
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        title: Text(
          "Perbaharui profile",
          style: redTextStyle.copyWith(
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
              children: [
                Text(
                  "Tolong perbaharui profile untuk kemudahan anda dalam pencarian mobil yang diinginkan ",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage(selectedPage: 3),
                        ),
                      );
                    },
                    child: Text(
                      "Perbaharui data",
                      style: blackTextStyle.copyWith(
                        fontSize: 15,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 5), (t) {
      if (mounted) {
        setState(() {
          _showwidget = const Center(
            child: Text(
              "Data tidak ditemukan",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ); //set loading to false
        });
      }
      t.cancel(); //stops the timer
    });
  }

  @override
  Widget build(BuildContext context) {
    final allPlaceProvider = Provider.of<Placesdata>(context);
    final nameUser = Provider.of<Placesdata>(context).name;
    final userId = Provider.of<Placesdata>(context).userid;
    if (nameUser == "User") {
      setState(() {
        _isSameName = true;
      });
    }
    return DefaultTabController(
      length: categoryData.length,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            color: kWhiteColor,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: UsernameText(
                        data: allPlaceProvider.name,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isFavorit = !_isFavorit;
                          });
                        },
                        icon: Icon(_isFavorit
                            ? CupertinoIcons.bell
                            : CupertinoIcons.bell_fill),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(selectedPage: 1),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(
                      top: 20,
                      left: 5,
                      right: 5,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhite,
                      border: Border.all(
                        color: kBlack,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width / 1.8,
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Cari Mobil ",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SizedBox(
                          height: 35,
                          width: 50,
                          child: Center(
                            child: Icon(
                              Icons.search,
                              size: 24,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  indicator: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorPadding: const EdgeInsets.all(5),
                  isScrollable: true,
                  labelColor: kWhite,
                  unselectedLabelColor: kLightGray,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  tabs: categorydata.map(
                    (e) {
                      return Tab(
                        child: Container(
                          margin: const EdgeInsets.only(right: 23, left: 20),
                          child: Text(
                            e.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "Monstserrat",
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: (allPlaceProvider.tempat.isEmpty)
                        ? Align(
                            alignment: Alignment.center,
                            child: _showwidget,
                          )
                        : TabBarView(
                            children: [
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.TOYOTA.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => DetailsPage(
                                      //       pickplace: allPlaceProvider
                                      //           .recommended[index],
                                      //     ),
                                      //   ),

                                      // );
                                    },
                                    child: ListPlace(
                                      tempatdata:
                                          allPlaceProvider.TOYOTA[index],
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.HONDA.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => DetailsPage(
                                      //       pickplace: allPlaceProvider
                                      //           .recommended[index],
                                      //     ),
                                      //   ),

                                      // );
                                    },
                                    child: ListPlace(
                                      tempatdata: allPlaceProvider.HONDA[index],
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.MITSUBISHI.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => DetailsPage(
                                      //       pickplace: allPlaceProvider
                                      //           .tempat[index],
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: ListPlace(
                                      tempatdata:
                                          allPlaceProvider.MITSUBISHI[index],
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.NISSAN.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => DetailsPage(
                                      //       pickplace: allPlaceProvider
                                      //           .tempat[index],
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: ListPlace(
                                      tempatdata:
                                          allPlaceProvider.NISSAN[index],
                                    ),
                                  );
                                },
                              ),
                              ListView.builder(
                                padding: const EdgeInsets.only(top: 10),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allPlaceProvider.ISUZU.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => DetailsPage(
                                      //       pickplace: allPlaceProvider
                                      //           .tempat[index],
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: ListPlace(
                                      tempatdata: allPlaceProvider.ISUZU[index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
