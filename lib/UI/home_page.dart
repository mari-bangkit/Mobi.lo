import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/category.dart';

import 'package:yuk_mancing/UI/Widget/HomeWidget/list_place.dart';
import 'package:yuk_mancing/UI/Widget/HomeWidget/username_text.dart';
import 'package:yuk_mancing/UI/details_page.dart';
import 'package:yuk_mancing/main.dart';
import 'package:yuk_mancing/providers/place_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFavorit = true;
  bool isInit = true;
  bool _isloading = true;

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

  void startTimer() {
    Timer.periodic(const Duration(seconds: 5), (t) {
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
      t.cancel(); //stops the timer
    });
  }

  @override
  Widget build(BuildContext context) {
    final allPlaceProvider = Provider.of<Placesdata>(context);
    return DefaultTabController(
      length: categoryData.length,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
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
                    height: 56,
                    margin: const EdgeInsets.only(
                      top: 30,
                      left: 10,
                      right: 10,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: kWhite,
                      border: Border.all(
                        color: kBlack,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width / 1.8,
                          padding: const EdgeInsets.all(10),
                          child: const Text("Search Furniture",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SizedBox(
                          height: 44,
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
                              fontSize: 20,
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
