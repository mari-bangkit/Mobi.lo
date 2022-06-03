import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/customer_model.dart';

class AiPrediction with ChangeNotifier {
  Uri urlMaster = Uri.parse(
      'http://f902266d-0271-4e20-bea5-43819609802c.southeastasia.azurecontainer.io/score');

  Future<void> getResultApi() async {
    var data = {
      "Inputs": {
        "data": [
          {
            "Customer Name": "Alfridan Ripani",
            "Customer e-mail": "alastair20@gmail.com",
            "Country": "Indonesia",
            "Gender": 1,
            "Age": 24,
            "Annual Salary": 120000000,
            "Credit Card Debt": 12000000,
            "Net Worth": 300000000,
          }
        ]
      },
      "GlobalParameters": 0.0
    };
    print(data.toString());

    var response = await http.post(
      urlMaster,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer QOcTkikRDMuZHq1zGqtDAq4mxBBTu4iB"
      },
      body: jsonEncode(data),
    );

    var responData = jsonDecode(response.body);
    List results = responData['Results'];
    print(results[0]);
  }
}
