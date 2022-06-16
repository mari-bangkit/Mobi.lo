import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constant/style.dart';
import '../../../Model/players.dart';

class HistoryData extends StatelessWidget {
  final Players historyPlace;
  const HistoryData({
    Key? key,
    required this.historyPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kLightGray.withOpacity(0.7),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: const [
                    Text(
                      "Tanggal : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: kBlack,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      " historyPlace.date",
                      style: TextStyle(
                        fontSize: 18,
                        color: kBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: const [
                    Text(
                      "Jam : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: kBlack,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "historyPlace.time",
                      style: TextStyle(
                        fontSize: 18,
                        color: kBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: kLightGray,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 90,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage("historyPlace.datatempat.imageUrl"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      color: kBlack.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width - 90 - 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: const Text(
                                "historyPlace.datatempat.name",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: kBlack,
                                  fontFamily: "Monstserrat",
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Icon(
                              CupertinoIcons.star_fill,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "historyPlace.datatempat.rating",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Monstserrat",
                                color: kBlack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
