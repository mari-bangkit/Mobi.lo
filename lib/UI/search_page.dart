import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_mancing/UI/Widget/SearchWidget/search_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = " ";

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
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                height: 72,
                width: MediaQuery.of(context).size.width / 1.5,
                child: const Text(
                  "Yuk cari dulu \ntempatnya",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat Alternates "),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SearchWidget(text: query, hintText: "Search here")
            ],
          ),
        ),
      ),
    );
  }
}
