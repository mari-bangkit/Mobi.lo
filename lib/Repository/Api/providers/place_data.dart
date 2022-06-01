import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/brand.dart';

class Placesdata with ChangeNotifier {
  late String token;
  late String userid;
  late String name;
  late String dataEmail;

  List<Brand> tempat = [];
  List<Brand> TOYOTA = [];
  List<Brand> HONDA = [];
  List<Brand> MITSUBISHI = [];
  List<Brand> NISSAN = [];
  List<Brand> ISUZU = [];

  void updatedata(tokenData, uid, username, email) {
    token = tokenData;
    userid = uid;
    name = username;
    dataEmail = email;

    notifyListeners();
  }

  Future<void> getdataplace() async {
    Uri url = Uri.parse(
        "https://carpredictionapp-default-rtdb.firebaseio.com/datamobil.json?auth=$token");

    var hasilGetData = await http.get(url);
    // final DataTempat data = dataTempatFromJson(hasilGetData.body);

    final List<Brand> data = brandFromJson(hasilGetData.body);

    tempat = data;

    TOYOTA = data.where((element) => element.brand.contains("Toyota")).toList();
    HONDA = data.where((element) => element.brand.contains("Honda")).toList();
    MITSUBISHI =
        data.where((element) => element.brand.contains("Mitsubishi")).toList();
    NISSAN = data.where((element) => element.brand.contains("Nissan")).toList();
    ISUZU = data.where((element) => element.brand.contains("Isuzu")).toList();
    notifyListeners();
  }
}
