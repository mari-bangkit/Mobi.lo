import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../../Model/customer_model.dart';

class AiPrediction with ChangeNotifier {
  var results;

  Uri urlMaster =
      Uri.parse('https://maribangkit.eastus.inference.ml.azure.com/score');

  Future<void> getResultApi(
    Customer customer,
  ) async {
    var data = {
      "data": {
        "Customer Name": customer.customerName,
        "Customer e-mail": customer.customerEMail,
        "Country": customer.country,
        "Gender": customer.gender,
        "Age": customer.age,
        "Annual Salary": customer.annualSalary,
        "Credit Card Debt": customer.creditCardDebt,
        "Net Worth": customer.netWorth,
      }
    };
    print(data.toString());

    var response = await http.post(
      urlMaster,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer a7GOwkoSMRqCgBJP4WG4DgQ4f7cePXtb",
        "azureml-model-deployment": "initial",
      },
      body: jsonEncode(data),
    );

    print("proses selesai");
    var responData = jsonDecode(response.body);
    print("ini print respondata " + responData.toString());
    results = responData['Result']['max_value'];
  }
}
