import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/places_data.dart';

class Placesdata with ChangeNotifier {
  List<Datatempat> tempat = [];
  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://yukmancing-88624-default-rtdb.firebaseio.com/Tempat.json");

    var hasilGetData = await http.get(url);
    final Places data = placesFromJson(hasilGetData.body);
    tempat = data.datatempat;
    notifyListeners();
  }
}
