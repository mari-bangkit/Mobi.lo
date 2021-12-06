import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class ListPlace extends StatefulWidget {
  const ListPlace({Key? key}) : super(key: key);

  @override
  State<ListPlace> createState() => _ListPlaceState();
}

class _ListPlaceState extends State<ListPlace> {
  bool _isFavorit = true;
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
              2.0,
              2.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 1.0,
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
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nama Tempat",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: kBlack,
                          fontFamily: "Monstserrat",
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(
                          () {
                            _isFavorit = !_isFavorit;
                          },
                        ),
                        icon: Icon(
                          _isFavorit
                              ? CupertinoIcons.heart
                              : CupertinoIcons.heart_fill,
                          color: Colors.red,
                        ),
                      ),
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
