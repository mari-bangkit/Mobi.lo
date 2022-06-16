import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../Constant/style.dart';
import '../../Model/brand.dart';
import 'underconstructor_pages.dart';

class DetailsPage extends StatelessWidget {
  final Brand brand;
  const DetailsPage({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Container(
      //   height: 50,
      //   width: MediaQuery.of(context).size.width,
      //   margin: const EdgeInsets.only(
      //     left: 10,
      //     right: 10,
      //   ),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: const Text(
      //       "Booking",
      //       style: TextStyle(
      //         fontSize: 15,
      //         fontWeight: FontWeight.w700,
      //         fontFamily: "Montserrat",
      //       ),
      //     ), //child widget inside this button
      //     shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(15.0),
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(brand.linkImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back,
                                size: 25, color: kWhite),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 235,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 1.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          color: kWhite,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        brand.type.toString(),
                                        style: blackTextStyle.copyWith(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 23,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        brand.merk,
                                        style: greyTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        NumberFormat.currency(
                                          locale: 'id-ID',
                                          symbol: 'IDR ',
                                          decimalDigits: 0,
                                        ).format(brand.price),
                                        style: yellowTextStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 90,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 75,
                                      height: 80,
                                      margin: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: kPrimary.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.local_gas_station,
                                            color: kWhite,
                                            size: 30,
                                          ),
                                          Text(
                                            brand.bbm,
                                            style: blackTextStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: semiBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 75,
                                      height: 80,
                                      margin: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: kPrimary.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.power,
                                            color: kWhite,
                                            size: 30,
                                          ),
                                          Text(
                                            brand.cc.toString(),
                                            style: blackTextStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: semiBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 75,
                                      height: 80,
                                      margin: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: kPrimary.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.chair_alt,
                                            color: kWhite,
                                            size: 30,
                                          ),
                                          Text(
                                            brand.kursi.toString(),
                                            style: blackTextStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: semiBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Montserrat",
                                  color: kLightGray,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  right: 5,
                                ),
                                child: const ReadMoreText(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Fringilla phasellus faucibus scelerisque eleifend. Nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum. Risus sed vulputate odio ut. Senectus et netus et malesuada fames ac turpis egestas. Convallis tellus id interdum velit. Odio eu feugiat pretium nibh ipsum consequat.",
                                  trimLines: 3,
                                  textAlign: TextAlign.justify,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: "Show more",
                                  trimExpandedText: "Show less",
                                  lessStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green,
                                  ),
                                  moreStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green,
                                  ),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kLightGray,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 1,
                                    height: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Column(
                  //   children: [
                  //     const SizedBox(
                  //       height: 200,
                  //     ),
                  //     Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Container(
                  //         height: 70,
                  //         width: 70,
                  //         margin: const EdgeInsets.only(left: 20),
                  //         child: TextButton(
                  //           style: TextButton.styleFrom(
                  //             padding: const EdgeInsets.all(10),
                  //             primary: Colors.black26,
                  //             backgroundColor: kSecondary,
                  //             shape: const RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(50),
                  //               ),
                  //             ),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) =>
                  //                     const UnderConstructor(),
                  //               ),
                  //             );
                  //           },
                  //           child: const ImageIcon(
                  //             AssetImage(
                  //               "Assets/Icons/directions.png",
                  //             ),
                  //             color: kBlack,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
