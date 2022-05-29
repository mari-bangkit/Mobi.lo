import 'package:flutter/material.dart';

import '../../../Constant/style.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;

  const ProfileMenuItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semiBold,
              color: kBlackColor,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.chevron_right,
            color: kBlackColor,
          ),
        ],
      ),
    );
  }
}
