import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class AppbarCostum extends StatelessWidget {
  final IconData leftIcon;
  final String nameappbar;
  final Widget leftCallback;

  const AppbarCostum({
    Key? key,
    required this.leftIcon,
    required this.nameappbar,
    required this.leftCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => leftCallback,
              ),
            );
          },
          child: Icon(
            leftIcon,
            size: 30,
            color: kBlack,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Text(
          nameappbar,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
