import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yuk_mancing/UI/Widget/HistoryWidget/history_data.dart';
import 'package:yuk_mancing/providers/player.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isInit = true;
  bool _isloading = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<PlayersProviders>(context).initialData();
      setState(() {
        _isloading = false;
      });
    }
    isInit = false;
    super.didChangeDependencies();
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
                    ? const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: playersdata.history.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print(playersdata.history.length);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => DetailsPage(pickplace: null,),
                              //   ),
                              // );
                            },
                            child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    // An action can be bigger than the others.
                                    flex: 2,
                                    onPressed: deleteplayer,
                                    backgroundColor: const Color(0xFF7BC043),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: HistoryData(
                                historyPlace: playersdata.history[index],
                              ),
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
