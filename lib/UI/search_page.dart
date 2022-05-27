import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/brand.dart';
import 'package:yuk_mancing/Model/categorydata.dart';
import 'package:yuk_mancing/UI/Widget/HomeWidget/list_place.dart';
import 'package:yuk_mancing/UI/Widget/SearchWidget/search_widget.dart';
import 'package:yuk_mancing/UI/details_page.dart';
import 'package:yuk_mancing/providers/place_data.dart';

import '../providers/player.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Brand> searchdata = [];
  List<Brand> searchplaces = [];
  String query = "";
  bool isInit = true;
  late String nama, email;

  @override
  void didChangeDependencies() {
    if (isInit) {
      searchdata = searchplaces = Provider.of<Placesdata>(context).tempat;
    }
    isInit = false;
    nama = Provider.of<Placesdata>(context).name;
    email = Provider.of<Placesdata>(context).dataEmail;
    super.didChangeDependencies();
  }

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
          child: (searchplaces != null)
              ? Column(
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
                              text: ', dicari \ndulu tempatnya',
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
                      child: ListView.builder(
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
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                      ),
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Data Tidak ditemukan",
                        style: TextStyle(
                            color: kPrimary,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchPlaces,
      );

  void searchPlaces(String query) {
    final books = searchdata.where((book) {
      final titleLower = book.model.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      searchplaces = books;
    });
  }

  void filterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          title: const Text(
            "Filter",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          titlePadding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          children: [
            Text(
              nama.toString(),
              style: const TextStyle(
                  fontSize: 20, color: kBlack, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
