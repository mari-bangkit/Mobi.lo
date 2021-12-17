import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yuk_mancing/Constant/style.dart';
import 'package:intl/intl.dart';
import 'package:yuk_mancing/Model/history_place_model.dart';

import 'Widget/Bookingwidget/date_field.dart';
import 'Widget/Bookingwidget/time_field.dart';

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

  // var _name;
  // var _numberWA;
  // var _date;
  // var _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: FloatingActionButton(
          onPressed: () {
            var _name = _myNamecontroler.text;
            var _numberWA = _myNumbercontroler.text;
            var _date = DateFormat("dd-MM-yyyy").format(eventDate!);
            var _time = eventTime!.format(context);
            historylist.add(
              HistoryPlace(_name, _numberWA, _date, _time),
            );
            Fluttertoast.showToast(
                msg: "Booking telah disimpan", gravity: ToastGravity.BOTTOM);
            setState(() {});
            Navigator.of(context).pop();
            print("Tempat dipesan \nNama :" +
                _name +
                "\nnomor: " +
                _numberWA +
                "\ntanggal: " +
                _date +
                "\njam: " +
                _time);
          },
          child: const Text(
            "Booking now",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: "Montserrat",
            ),
          ), //child widget inside this button
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
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
              // const AppbarCostum(
              //   leftIcon: Icons.arrow_back,
              //   nameappbar: "Isi dulu \npendaftarannya",
              //   leftCallback: DetailsPage(),
              // ),
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
                height: 10,
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
                height: 10,
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
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Jam berapa ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat"),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () async {
                  final _now = TimeOfDay.now();
                  eventTime = await showTimePicker(
                    context: context,
                    initialTime: _now,
                  );
                  setState(() {});
                },
                child: TimeField(eventTime: eventTime),
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
