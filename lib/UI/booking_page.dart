import 'package:flutter/material.dart';
import 'package:yuk_mancing/UI/Widget/GlobalWidget/appbar_costum.dart';
import 'package:yuk_mancing/UI/details_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
          ),
          child: ListView(
            children: const [
              AppbarCostum(
                leftIcon: Icons.arrow_back,
                nameappbar: "Isi dulu \npendaftarannya",
                leftCallback: DetailsPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
