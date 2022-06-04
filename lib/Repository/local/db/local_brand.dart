import 'dart:convert';

DataBrand dataTempatFromJson(String str) =>
    DataBrand.fromJson(json.decode(str));

String dataTempatToJson(DataBrand data) => json.encode(data.toJson());

class DataBrand {
  DataBrand({
    required this.error,
    required this.message,
    required this.count,
    required this.brand,
  });

  bool error;
  String message;
  int count;
  List<localBrand> brand;

  factory DataBrand.fromJson(Map<String, dynamic> json) => DataBrand(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        brand: List<localBrand>.from(
            json["brand"].map((x) => localBrand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "brand": List<dynamic>.from(brand.map((x) => x.toJson())),
      };
}

class localBrand {
  localBrand({
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

  localBrand copyWith({
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
      localBrand(
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

  factory localBrand.fromJson(Map<String, dynamic> json) => localBrand(
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
