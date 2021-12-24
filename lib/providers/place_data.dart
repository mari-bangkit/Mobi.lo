import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/categorydata.dart';

class Placesdata with ChangeNotifier {
  late String token;
  late String userid;
  List<Bestplace> tempat = [];
  List<Bestplace> newplace = [];
  List<Bestplace> recommended = [];
  List<Bestplace> bestplace = [];
  List<Bestplace> popular = [];

  void updatedata(tokenData, uid) {
    token = tokenData;
    userid = uid;

    notifyListeners();
  }

  Future<void> getdataplace() async {
    Uri url = Uri.parse(
        "https://yukmancing-88624-default-rtdb.firebaseio.com/place.json?auth=$token");

    var hasilGetData = await http.get(url);
    final DataTempat data = dataTempatFromJson(hasilGetData.body);
    newplace = data.newplace;
    recommended = data.recomended;
    bestplace = data.bestplace;
    popular = data.popular;
    tempat = data.placedata;

    notifyListeners();
  }
}
