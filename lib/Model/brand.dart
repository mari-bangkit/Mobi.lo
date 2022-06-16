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
    required this.merk,
    required this.type,
    required this.price,
    required this.detail,
    required this.kursi,
    required this.cc,
    required this.bbm,
    required this.linkImg,
  });

  int id;
  String merk;
  String type;
  int price;
  String detail;
  String kursi;
  String cc;
  String bbm;
  String linkImg;

  Brand copyWith({
    int? id,
    String? merk,
    String? type,
    int? price,
    String? detail,
    String? kursi,
    String? cc,
    String? bbm,
    String? linkImg,
  }) =>
      Brand(
        id: id ?? this.id,
        merk: merk ?? this.merk,
        type: type ?? this.type,
        price: price ?? this.price,
        detail: detail ?? this.detail,
        kursi: kursi ?? this.kursi,
        cc: cc ?? this.cc,
        bbm: bbm ?? this.bbm,
        linkImg: linkImg ?? this.linkImg,
      );

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        merk: json["merk"],
        type: json["type"],
        price: json["price"],
        detail: json["detail"],
        kursi: json["kursi"],
        cc: json["CC"],
        bbm: json["BBM"],
        linkImg: json["link_img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "merk": merk,
        "type": type,
        "price": price,
        "detail": detail,
        "kursi": kursi,
        "CC": cc,
        "BBM": bbm,
        "link_img": linkImg,
      };
}
