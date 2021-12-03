import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                height: 72,
                width: MediaQuery.of(context).size.width / 1.5,
                child: RichText(
                  text: const TextSpan(
                    text: "Nih",
                    style: TextStyle(
                        color: kPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: ', history booking \ntempat kamu',
                        style: TextStyle(
                          color: kBlack,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
