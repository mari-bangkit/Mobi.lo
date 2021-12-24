import 'dart:convert';

import 'package:yuk_mancing/Model/places_data.dart';

Players playersFromJson(String str) => Players.fromJson(json.decode(str));

String playersToJson(Players data) => json.encode(data.toJson());

class Players {
  Players({
    required this.id,
    required this.nama,
    required this.noWa,
    required this.date,
    required this.time,
    required this.userID,
    required this.datatempat,
  });

  String id;
  String nama;
  String noWa;
  String date;
  String time;
  String userID;
  Datatempat datatempat;
  factory Players.fromJson(Map<String, dynamic> json) => Players(
        id: json["id"],
        nama: json["nama"],
        noWa: json["noWa"],
        date: json["date"],
        time: json["time"],
        userID: json["userID"],
        datatempat: Datatempat.fromJson(json["datatempat"]),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "noWa": noWa,
        "date": date,
        "time": time,
        "userID": userID,
        "datatempat": datatempat.toJson(),
      };
}
