import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/places_data.dart';

class Placesdata with ChangeNotifier {
  late String token;
  List<Datatempat> tempat = [];

  void updatedata(tokenData) {
    token = tokenData;
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
}
