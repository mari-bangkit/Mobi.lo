import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Repository/Api/providers/auth.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (username == null)
                ? Text(
                    "Hi $data ,",
                    style: const TextStyle(
                        fontSize: 25,
                        fontFamily: "Monstserrat",
                        fontWeight: FontWeight.bold,
                        color: kBlack),
                  )
                : Text(
                    "Hi $username ,",
                    style: const TextStyle(
                        fontSize: 25,
                        fontFamily: "Monstserrat",
                        fontWeight: FontWeight.bold,
                        color: kBlack),
                  ),
            const Text(
              "Good day For buying car",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Monstserrat",
                  fontWeight: FontWeight.w600,
                  color: kBlack),
            ),
          ],
        ));
  }
}
