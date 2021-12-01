import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class ListPlace extends StatelessWidget {
  const ListPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 5),
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
          )
        ],
      ),
    );
  }
}
