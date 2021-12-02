import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/UI/home_page.dart';
import 'package:readmore/readmore.dart';
import 'package:yuk_mancing/main.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

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
              print("Dipesan");
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
                      decoration: const BoxDecoration(
                        /*image: DecorationImage(
                      image: AssetImage(""),
                    ),*/
                        color: Colors.blue,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyHomePage(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.arrow_back,
                                  size: 25, color: kWhite),
                            ),
                            const Icon(
                              CupertinoIcons.heart,
                              size: 25,
                              color: kWhite,
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
                          height: MediaQuery.of(context).size.height,
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
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                const Text(
                                  "Nama Tempat",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(CupertinoIcons.star_fill,
                                            color: Colors.yellow),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "Rating",
                                          style: TextStyle(
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
                                      children: const [
                                        Icon(
                                          CupertinoIcons.location,
                                          color: kGray,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                            fontSize: 18,
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
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(top: 10),
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 60,
                                        height: 60,
                                        margin: const EdgeInsets.only(
                                          right: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          color: kGray,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      );
                                    },
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
                                const ReadMoreText(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Maecenas accumsan lacus vel facilisis volutpat est velit. Nisl purus in mollis nunc. Ornare arcu dui vivamus arcu felis bibendum ut. At quis risus sed vulputate odio ut.",
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
                              onPressed: () {},
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
        ));
  }
}
