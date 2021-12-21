import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/places_data.dart';
import 'package:yuk_mancing/Model/players.dart';

class PlayersProviders with ChangeNotifier {
  List<Players> history = [];
  late String token;
  late String userid;

  void updatedata(tokenData, uid) {
    token = tokenData;
    userid = uid;
    notifyListeners();
  }

  String urlmaster = "https://yukmancing-88624-default-rtdb.firebaseio.com/";

  addPlayer(String name, String noWa, String date, String time,
      Datatempat tempat) async {
    var id = "";
    print(userid);
    Uri url = Uri.parse('$urlmaster/history.json?auth=$token');

    var data = Players(
        id: id,
        nama: name,
        noWa: noWa,
        date: date,
        time: time,
        datatempat: tempat,
        userID: userid);
    print(data);

    try {
      final response = await http.post(
        url,
        body: playersToJson(data),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        '$urlmaster/history.json?auth=$token&orderBy="userID"&equalTo="$userid"');

    var hasilGetData = await http.get(url);
    print(hasilGetData.body);
    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    history.clear();
    dataResponse.forEach(
      (key, value) {
        Players prod = Players(
          id: key,
          nama: value["nama"],
          noWa: value["noWa"],
          date: value["date"],
          time: value["time"],
          datatempat: Datatempat.fromJson(
            value["datatempat"],
          ),
          userID: value["userID"],
        );
        history.add(prod);
      },
    );
    print("BERHASIL MASUKAN DATA LIST");

    notifyListeners();
  }
}
