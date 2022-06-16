import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../Constant/style.dart';
import '../../Model/brand.dart';
import '../../Model/customer_model.dart';
import '../../Repository/Api/providers/aI_prediction_api.dart';
import '../../Repository/Api/providers/place_data.dart';
import '../../Repository/Api/providers/player.dart';
import '../Widget/HomeWidget/list_place.dart';
import '../Widget/SearchWidget/search_widget.dart';

class SearchPage extends StatefulWidget {
  final bool isFocus;
  const SearchPage({Key? key, required this.isFocus}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Brand> searchdata = [];
  List<Brand> searchplaces = [];
  String query = "";
  bool isInit = true;
  var selectedGender;
  late String nama, email;

  Duration get changeTime => const Duration(milliseconds: 200);

  TextEditingController annualSalary = TextEditingController();
  TextEditingController creditCardDebt = TextEditingController();
  TextEditingController netWorth = TextEditingController();

  Widget _showwidget = const CircularProgressIndicator();

  @override
  void didChangeDependencies() {
    if (isInit) {
      searchdata =
          searchplaces = Provider.of<Placesdata>(context, listen: false).tempat;
    }
    isInit = false;
    startTimer();
    super.didChangeDependencies();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 5), (t) {
      if (mounted) {
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
      }
      t.cancel(); //stops the timer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: const TextSpan(
                      text: "Yuk",
                      style: TextStyle(
                          color: kPrimary,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        TextSpan(
                          text: ', dicari \ndulu Mobilnya',
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
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: buildSearch(),
                    ),
                    TextButton(
                      onPressed: () {
                        filterDialog(context);
                      },
                      child: Image.asset(
                        "Assets/Images/icon_filter.png",
                        width: 24,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: (searchplaces.isNotEmpty)
                      ? ListView.builder(
                          itemCount: searchplaces.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final book = searchplaces[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => DetailsPage(
                                //       pickplace: book,
                                //     ),
                                //   ),
                                // );
                              },
                              child: ListPlace(
                                tempatdata: book,
                              ),
                            );
                          },
                        )
                      : Container(
                          margin: const EdgeInsets.only(
                            top: 30,
                          ),
                          height: 75,
                          width: MediaQuery.of(context).size.width,
                          child: _showwidget),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Nama atau Model Mobil',
        onChanged: searchPlaces,
      );

  void searchPlaces(String query) {
    final books = searchdata.where((book) {
      final merkLower = book.merk.toLowerCase();
      final typeLower = book.type.toLowerCase();
      final searchLower = query.toLowerCase();

      return merkLower.contains(searchLower) || typeLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      searchplaces = books;
    });
  }

  void refreshPage() {
    double max = double.parse(
        Provider.of<AiPrediction>(context, listen: false).results.toString());
    final data = searchdata.where((data) {
      final price = data.price <= max;
      return price;
    }).toList();

    setState(() {
      this.query = query;
      searchplaces = data;
    });
  }

  void filterDialog(BuildContext context) {
    final playersdata =
        Provider.of<PlayersProviders>(context, listen: false).history;
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          title: Text(
            "Masukan tambahan data: ",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          titlePadding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          children: [
            annualsalary(),
            creditdebit(),
            networth(),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  if (playersdata[0].gender == "Laki-Laki") {
                    selectedGender = 1;
                  } else {
                    selectedGender = 0;
                  }

                  Customer customer = Customer(
                    customerName: playersdata[0].customerName,
                    customerEMail: playersdata[0].customerEMail,
                    country: playersdata[0].country,
                    gender: selectedGender,
                    age: playersdata[0].age,
                    annualSalary: int.parse(annualSalary.text),
                    creditCardDebt: int.parse(creditCardDebt.text),
                    netWorth: int.parse(netWorth.text),
                  );

                  Future.delayed(changeTime).then(
                    (value) async {
                      String message = "in";
                      try {
                        await Provider.of<AiPrediction>(context, listen: false)
                            .getResultApi(customer);
                      } catch (e) {
                        message = e.toString();
                        print(message);
                        return message;
                      } finally {
                        if (message != "in") {
                          Fluttertoast.showToast(
                            msg: message.toString(),
                            fontSize: 18,
                            gravity: ToastGravity.BOTTOM,
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Filter disesuaikan",
                              gravity: ToastGravity.BOTTOM);
                          refreshPage();
                        }
                      }
                      Navigator.pop(context);
                    },
                  );
                },
                child: Text(
                  "Filter",
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget annualsalary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gaji Tahunan anda : ",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: annualSalary,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'cth: 120000000',
              ),
              style: blackAccentTextStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget creditdebit() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Credit anda dibank : ",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: creditCardDebt,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'cth: 120000000',
              ),
              style: blackAccentTextStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget networth() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Kekayaan anda: ",
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: netWorth,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'cth: 120000000',
              ),
              style: blackAccentTextStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
