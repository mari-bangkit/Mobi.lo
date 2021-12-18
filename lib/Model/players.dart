import 'dart:convert';

import 'package:yuk_mancing/Model/places_data.dart';

Players playersFromJson(String str) => Players.fromJson(json.decode(str));

String playersToJson(Players data) => json.encode(data.toJson());

class Players {
  Players({
    required this.nama,
    required this.noWa,
    required this.date,
    required this.time,
    required this.datatempat,
  });

  String nama;
  String noWa;
  String date;
  String time;
  Datatempat datatempat;

  factory Players.fromJson(Map<String, dynamic> json) => Players(
        nama: json["nama"],
        noWa: json["noWa"],
        date: json["date"],
        time: json["time"],
        datatempat: Datatempat.fromJson(json["datatempat"]),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "noWa": noWa,
        "date": date,
        "time": time,
        "datatempat": datatempat.toJson(),
      };
}
