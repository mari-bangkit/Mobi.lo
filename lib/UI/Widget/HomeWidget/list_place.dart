import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/brand.dart';

class ListPlace extends StatefulWidget {
  final Brand tempatdata;
  const ListPlace({Key? key, required this.tempatdata}) : super(key: key);

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
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kLightGray.withOpacity(0.2),
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
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.tempatdata.imageUrl),
                fit: BoxFit.cover,
              ),
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
                  child: Text(
                    widget.tempatdata.varian,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kBlack,
                      fontFamily: "Monstserrat",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: const Icon(CupertinoIcons.location)),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        widget.tempatdata.model,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Monstserrat",
                          color: kGray,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: const Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.yellow,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        widget.tempatdata.jumlahKursi.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Monstserrat",
                          color: kGray2.withOpacity(0.6),
                        ),
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
