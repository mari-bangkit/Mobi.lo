import 'dart:convert';

import 'package:yuk_mancing/Model/categorydata.dart';

Players playersFromJson(String str) => Players.fromJson(json.decode(str));

String playersToJson(Players data) => json.encode(data.toJson());

class Players {
  Players({
    required this.customerName,
    required this.customerEMail,
    required this.country,
    required this.gender,
    required this.age,
    required this.userID,
  });

  String customerName;
  String customerEMail;
  String country;
  String gender;
  int age;
  String userID;

  factory Players.fromJson(Map<String, dynamic> json) => Players(
        customerName: json["Customer Name"],
        customerEMail: json["Customer e-mail"],
        country: json["Country"],
        gender: json["Gender"],
        age: json["Age"],
        userID: json["userID"],
      );

  Map<String, dynamic> toJson() => {
        "Customer Name": customerName,
        "Customer e-mail": customerEMail,
        "Country": country,
        "Gender": gender,
        "Age": age,
        "userID": userID,
      };
}
