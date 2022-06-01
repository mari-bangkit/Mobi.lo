import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Repository/Api/providers/player.dart';
import 'package:yuk_mancing/UI/Widget/HistoryWidget/history_data.dart';
import 'package:yuk_mancing/UI/details_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isInit = true;

  Widget _showwidget = const CircularProgressIndicator();

  @override
  void initState() {
    startTimer(); //start the timer on loading
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<PlayersProviders>(context).initialData();
    }
    Future.delayed(const Duration(seconds: 4));
    isInit = false;
    super.didChangeDependencies();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 5), (t) {
      setState(() {
        _showwidget = const Center(
          child: Text(
            "Data tidak ditemukan",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ); //set loading to false
      });
      t.cancel(); //stops the timer
    });
  }

  @override
  Widget build(BuildContext context) {
    final playersdata = Provider.of<PlayersProviders>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                height: 72,
                width: MediaQuery.of(context).size.width / 1.4,
                child: RichText(
                  text: const TextSpan(
                    text: "Nih",
                    style: TextStyle(
                        color: kPrimary,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: ', history booking tempat kamu',
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
                height: 10,
              ),
              Expanded(
                child: (playersdata.history.isEmpty)
                    ? Align(
                        alignment: Alignment.center,
                        child: _showwidget,
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: playersdata.history.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    pickplace:
                                        playersdata.history[index].datatempat,
                                  ),
                                ),
                              );
                            },
                            child: HistoryData(
                              historyPlace: playersdata.history[index],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteplayer(BuildContext context) {}
}
