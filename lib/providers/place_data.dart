import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/categorydata.dart';
import 'package:yuk_mancing/Model/places_data.dart';

class Placesdata with ChangeNotifier {
  late String token;
  late String userid;
  List<Datatempat> tempat = [];
  List<Bestplace> newplace = [];
  List<Bestplace> recommended = [];
  List<Bestplace> bestplace = [];
  List<Bestplace> popular = [];

  void updatedata(tokenData, uid) {
    token = tokenData;
    userid = uid;
    print(tokenData);
    notifyListeners();
  }

  Future<void> initialDataPlace() async {
    Uri url = Uri.parse(
        "https://yukmancing-88624-default-rtdb.firebaseio.com/Tempat.json?auth=$token");

    var hasilGetData = await http.get(url);
    final Places data = placesFromJson(hasilGetData.body);
    tempat = data.datatempat;
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

    print(newplace);
    print(recommended);
    notifyListeners();
  }
}
