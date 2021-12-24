import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/categorydata.dart';
import 'package:yuk_mancing/UI/Widget/HomeWidget/list_place.dart';
import 'package:yuk_mancing/UI/Widget/SearchWidget/search_widget.dart';
import 'package:yuk_mancing/UI/details_page.dart';
import 'package:yuk_mancing/providers/place_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Bestplace> searchdata = [];
  List<Bestplace> searchplaces = [];
  String query = "";
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      searchdata = searchplaces = Provider.of<Placesdata>(context).tempat;
    }
    isInit = false;
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
                    buildSearch(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: searchplaces.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final book = searchplaces[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    pickplace: book,
                                  ),
                                ),
                              );
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
      final titleLower = book.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      searchplaces = books;
    });
  }
}
