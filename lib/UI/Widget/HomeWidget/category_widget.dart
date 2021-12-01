import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:yuk_mancing/Model/category.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(
        top: 22,
      ),
      child: DefaultTabController(
        length: categoryData.length,
        child: TabBar(
          labelPadding: const EdgeInsets.all(0),
          indicator: BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          indicatorPadding: const EdgeInsets.all(5),
          isScrollable: true,
          labelColor: kWhite,
          unselectedLabelColor: kLightGray,
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          tabs: categorydata.map(
            (e) {
              return Tab(
                child: Container(
                  margin: const EdgeInsets.only(right: 23, left: 20),
                  child: Text(
                    e.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "Monstserrat",
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
