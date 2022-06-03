// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    required this.customerName,
    required this.customerEMail,
    required this.country,
    required this.gender,
    required this.age,
    required this.annualSalary,
    required this.creditCardDebt,
    required this.netWorth,
  });

  String customerName;
  String customerEMail;
  String country;
  int gender;
  int age;
  int annualSalary;
  int creditCardDebt;
  int netWorth;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerName: json["Customer Name"],
        customerEMail: json["Customer e-mail"],
        country: json["Country"],
        gender: json["Gender"],
        age: json["Age"],
        annualSalary: json["Annual Salary"],
        creditCardDebt: json["Credit Card Debt"],
        netWorth: json["Net Worth"],
      );

  Map<String, dynamic> toJson() => {
        "Customer Name": customerName,
        "Customer e-mail": customerEMail,
        "Country": country,
        "Gender": gender,
        "Age": age,
        "Annual Salary": annualSalary,
        "Credit Card Debt": creditCardDebt,
        "Net Worth": netWorth,
      };
}
