import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class UsernameText extends StatelessWidget {
  const UsernameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Hi Aldan,",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Monstserrat",
                fontWeight: FontWeight.bold,
                color: kBlack),
          ),
          Text(
            "Good day for fishing",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Monstserrat",
                fontWeight: FontWeight.w600,
                color: kBlack),
          ),
        ],
      ),
    );
  }
}
