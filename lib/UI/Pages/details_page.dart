import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:readmore/readmore.dart';
import 'package:yuk_mancing/Model/categorydata.dart';
import 'package:yuk_mancing/UI/Pages/booking_page.dart';
import 'package:yuk_mancing/UI/Pages/underconstructor_pages.dart';


class DetailsPage extends StatelessWidget {
  final Bestplace pickplace;
  const DetailsPage({Key? key, required this.pickplace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingPage(
                  tempatPilih: pickplace,
                ),
              ),
            );
          },
          child: const Text(
            "Booking",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat",
            ),
          ), //child widget inside this button
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
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
                        image: NetworkImage(pickplace.imageUrl),
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
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                pickplace.name,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(CupertinoIcons.star_fill,
                                          color: Colors.yellow),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        pickplace.rating,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Montserrat",
                                          color: kLightGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        CupertinoIcons.location,
                                        color: kGray,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        pickplace.alamat,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Montserrat",
                                          color: kLightGray,
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
                                            CupertinoIcons.square,
                                            color: kWhite,
                                            size: 30,
                                          ),
                                          const Text(
                                            "Kolam",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: kGray,
                                            ),
                                          ),
                                          Text(
                                            pickplace.fasilitas.kolam,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: kBlack,
                                            ),
                                          )
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
                                            Icons.house_outlined,
                                            color: kWhite,
                                            size: 30,
                                          ),
                                          const Text(
                                            "Toilet",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: kGray,
                                            ),
                                          ),
                                          Text(
                                            pickplace.fasilitas.toilet,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: kBlack,
                                            ),
                                          )
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
                  Column(
                    children: [
                      const SizedBox(
                        height: 200,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 70,
                          width: 70,
                          margin: const EdgeInsets.only(left: 20),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              primary: Colors.black26,
                              backgroundColor: kSecondary,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const UnderConstructor(),
                                ),
                              );
                            },
                            child: const ImageIcon(
                              AssetImage(
                                "Assets/Icons/directions.png",
                              ),
                              color: kBlack,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
