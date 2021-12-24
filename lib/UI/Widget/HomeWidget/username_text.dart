import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/providers/auth.dart';

class UsernameText extends StatelessWidget {
  final String data;

  const UsernameText({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<Auth>(context).usernamedata;
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: (username == null)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi $data ,",
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: "Monstserrat",
                      fontWeight: FontWeight.bold,
                      color: kBlack),
                ),
                const Text(
                  "Good day for fishing",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Monstserrat",
                      fontWeight: FontWeight.w600,
                      color: kBlack),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi $username ,",
                  style: const TextStyle(
                      fontSize: 30,
                      fontFamily: "Monstserrat",
                      fontWeight: FontWeight.bold,
                      color: kBlack),
                ),
                const Text(
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
