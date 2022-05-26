// To parse this JSON data, do
//
//     final brand = brandFromJson(jsonString);

import 'dart:convert';

List<Brand> brandFromJson(String str) =>
    List<Brand>.from(json.decode(str).map((x) => Brand.fromJson(x)));

String brandToJson(List<Brand> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Brand {
  Brand({
    required this.id,
    required this.brand,
    required this.model,
    required this.varian,
    required this.harga,
    required this.jumlahKursi,
    required this.cc,
    required this.dayaDorong,
    required this.imageUrl,
  });

  int id;
  String brand;
  String model;
  String varian;
  int harga;
  int jumlahKursi;
  int cc;
  int dayaDorong;
  String imageUrl;

  Brand copyWith({
    int? id,
    String? brand,
    String? model,
    String? varian,
    int? harga,
    int? jumlahKursi,
    int? cc,
    int? dayaDorong,
    String? imageUrl,
  }) =>
      Brand(
        id: id ?? this.id,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        varian: varian ?? this.varian,
        harga: harga ?? this.harga,
        jumlahKursi: jumlahKursi ?? this.jumlahKursi,
        cc: cc ?? this.cc,
        dayaDorong: dayaDorong ?? this.dayaDorong,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        brand: json["brand"],
        model: json["model"],
        varian: json["varian"],
        harga: json["harga"],
        jumlahKursi: json["jumlah_kursi"],
        cc: json["CC"],
        dayaDorong: json["Daya_dorong"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand,
        "model": model,
        "varian": varian,
        "harga": harga,
        "jumlah_kursi": jumlahKursi,
        "CC": cc,
        "Daya_dorong": dayaDorong,
        "imageUrl": imageUrl,
      };
}

enum BrandEnum { TOYOTA, HONDA, MITSUBISHI, NISSAN, ISUZU }
