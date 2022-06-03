import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/categorydata.dart';
import 'package:yuk_mancing/Model/players.dart';

class PlayersProviders with ChangeNotifier {
  List<Players> history = [];
  late String token;
  late String userid;
  late String idUser;

  void updatedata(tokenData, uid) {
    token = tokenData;
    userid = uid;
    notifyListeners();
  }

  String urlmaster = "https://carpredictionapp-default-rtdb.firebaseio.com/";

  addPlayer(int age, String country, String customerEMail, String customerName,
      String gender) async {
    var id = "";

    if (idUser == '') {
      Uri url = Uri.parse('$urlmaster/datauser.json?auth=$token');

      var data = Players(
        id: id,
        userID: userid,
        age: age,
        country: country,
        customerEMail: customerEMail,
        customerName: customerName,
        gender: gender,
      );

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

        print(
          json.decode(response.body),
        );
      } catch (error) {
        throw (error);
      }
    } else {
      Uri url = Uri.parse('$urlmaster/datauser/$idUser.json?auth=$token');
      var data = Players(
        id: id,
        userID: userid,
        age: age,
        country: country,
        customerEMail: customerEMail,
        customerName: customerName,
        gender: gender,
      );

      try {
        final response = await http.patch(
          url,
          body: playersToJson(data),
        );
        print(
          playersToJson(data),
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
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        '$urlmaster/datauser.json?auth=$token&orderBy="userID"&equalTo="$userid"');

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    history.clear();

    dataResponse.forEach(
      (key, value) {
        Players prod = Players(
          id: key,
          userID: value["userID"],
          age: value["Age"],
          country: value["Country"],
          customerEMail: value["Customer e-mail"],
          customerName: value["Customer Name"],
          gender: value["Gender"],
        );
        history.add(prod);
      },
    );

    if (history.isEmpty) {
      idUser = '';
    } else {
      idUser = history[0].id;
    }

    print(idUser);
    notifyListeners();
  }
}
