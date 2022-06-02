import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:yuk_mancing/Model/customer_model.dart';

class AiPrediction with ChangeNotifier {
  Uri urlMaster = Uri.parse(
      'http://f902266d-0271-4e20-bea5-43819609802c.southeastasia.azurecontainer.io/score');

  Future<void> getResultApi(Customer customer) async {
    var data = {
      "Inputs": {
        "data": [
          {
            "Customer Name": customer.customerName,
            "Customer e-mail": customer.customerEMail,
            "Country": customer.country,
            "Gender": 0,
            "Age": customer.age,
            "Annual Salary": customer.annualSalary,
            "Credit Card Debt": customer.annualSalary,
            "Net Worth": customer.netWorth,
          }
        ]
      },
      "GlobalParameters": 0.0
    };

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
