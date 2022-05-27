import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kBlackColor2 = kBlack;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: kBlack)),
        const SizedBox(
          height: 28,
        ),
        Row(
          children: [
            Container(
              width: 84,
              height: 4,
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kBlack,
              ),
            ),
            Container(
              width: 8,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kBlackColor2,
              ),
            )
          ],
        )
      ],
    );
  }
}
