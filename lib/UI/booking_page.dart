import 'package:flutter/material.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:intl/intl.dart';
import 'package:yuk_mancing/UI/Widget/GlobalWidget/appbar_costum.dart';
import 'package:yuk_mancing/UI/details_page.dart';

import 'Widget/Bookingwidget/date_field.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _myNamecontroler = TextEditingController();
  final TextEditingController _myNumbercontroler = TextEditingController();

  DateTime currentDate = DateTime.now();
  DateTime? eventDate;

  TimeOfDay currentTime = TimeOfDay.now();
  TimeOfDay? eventTime;

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
            children: [
              const AppbarCostum(
                leftIcon: Icons.arrow_back,
                nameappbar: "Isi dulu \npendaftarannya",
                leftCallback: DetailsPage(),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Nama Lengkap",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat"),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: kLightGray.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextField(
                  controller: _myNamecontroler,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "nama lengkap"),
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: kGray,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "No Whatsapp",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat"),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: kLightGray.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextField(
                  controller: _myNumbercontroler,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "whatsapp number"),
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: kGray,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Tanggal berapa ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat"),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: selectEventDate,
                child: DateField(eventDate: eventDate),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectEventDate() async {
    var today = DateTime.now();
    eventDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(currentDate.year + 1),
    );
    print(eventDate);
    if (eventDate != null && eventDate != today) {
      setState(() {
        today = eventDate!;
      });
    }
    //  else if (eventDate == null) {
    //   setState(() {
    //     eventDate = today;
    //   });
    // }
  }
}
