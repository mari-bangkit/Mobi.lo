// To parse this JSON data, do
//
//     final dataTempat = dataTempatFromJson(jsonString);

import 'dart:convert';

DataTempat dataTempatFromJson(String str) =>
    DataTempat.fromJson(json.decode(str));

String dataTempatToJson(DataTempat data) => json.encode(data.toJson());

class DataTempat {
  DataTempat({
    required this.bestplace,
    required this.newplace,
    required this.placedata,
    required this.popular,
    required this.recomended,
  });

  List<Bestplace> bestplace;
  List<Bestplace> newplace;
  List<Bestplace> placedata;
  List<Bestplace> popular;
  List<Bestplace> recomended;

  factory DataTempat.fromJson(Map<String, dynamic> json) => DataTempat(
        bestplace: List<Bestplace>.from(
            json["bestplace"].map((x) => Bestplace.fromJson(x))),
        newplace: List<Bestplace>.from(
            json["newplace"].map((x) => Bestplace.fromJson(x))),
        placedata: List<Bestplace>.from(
            json["placedata"].map((x) => Bestplace.fromJson(x))),
        popular: List<Bestplace>.from(
            json["popular"].map((x) => Bestplace.fromJson(x))),
        recomended: List<Bestplace>.from(
            json["recomended"].map((x) => Bestplace.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bestplace": List<dynamic>.from(bestplace.map((x) => x.toJson())),
        "newplace": List<dynamic>.from(newplace.map((x) => x.toJson())),
        "placedata": List<dynamic>.from(placedata.map((x) => x.toJson())),
        "popular": List<dynamic>.from(popular.map((x) => x.toJson())),
        "recomended": List<dynamic>.from(recomended.map((x) => x.toJson())),
      };
}

class Bestplace {
  Bestplace({
    required this.alamat,
    required this.fasilitas,
    required this.imageUrl,
    required this.name,
    required this.rating,
  });

  String alamat;
  Fasilitas fasilitas;
  String imageUrl;
  String name;
  String rating;

  factory Bestplace.fromJson(Map<String, dynamic> json) => Bestplace(
        alamat: json["alamat"],
        fasilitas: Fasilitas.fromJson(json["fasilitas"]),
        imageUrl: json["imageUrl"],
        name: json["name"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "alamat": alamat,
        "fasilitas": fasilitas.toJson(),
        "imageUrl": imageUrl,
        "name": name,
        "rating": rating,
      };
}

class Fasilitas {
  Fasilitas({
    required this.kolam,
    required this.toilet,
  });

  String kolam;
  String toilet;

  factory Fasilitas.fromJson(Map<String, dynamic> json) => Fasilitas(
        kolam: json["kolam"],
        toilet: json["toilet"],
      );

  Map<String, dynamic> toJson() => {
        "kolam": kolam,
        "toilet": toilet,
      };
}
