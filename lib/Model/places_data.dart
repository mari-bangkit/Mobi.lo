// To parse this JSON data, do
//
//     final places = placesFromJson(jsonString);

import 'dart:convert';

Places placesFromJson(String str) => Places.fromJson(json.decode(str));

String placesToJson(Places data) => json.encode(data.toJson());

class Places {
  Places({
    required this.datatempat,
  });

  List<Datatempat> datatempat;

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        datatempat: List<Datatempat>.from(
            json["datatempat"].map((x) => Datatempat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "datatempat": List<dynamic>.from(datatempat.map((x) => x.toJson())),
      };
}

class Datatempat {
  Datatempat({
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

  factory Datatempat.fromJson(Map<String, dynamic> json) => Datatempat(
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
