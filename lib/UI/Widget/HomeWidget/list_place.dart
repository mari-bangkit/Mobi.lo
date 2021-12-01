import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class ListPlace extends StatelessWidget {
  const ListPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      width: MediaQuery.of(context).size.width,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kLightGray.withOpacity(0.6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 117,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: kBlack.withOpacity(0.6),
            ),
          ),
          Container(
            height: 130,
            width: MediaQuery.of(context).size.width - 117 - 25,
            padding: const EdgeInsets.only(
              left: 5,
              right: 10,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 5,
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Nama Tempat",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: kBlack,
                          fontFamily: "Monstserrat",
                        ),
                      ),
                      Icon(CupertinoIcons.heart),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(CupertinoIcons.location),
                    Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Monstserrat",
                        color: kLightGray,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
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
                      "Rating",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Monstserrat",
                        color: kLightGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
