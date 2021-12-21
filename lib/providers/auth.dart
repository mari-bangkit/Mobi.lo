import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _idToken, userId;
  late DateTime _expirydate;

  String? get token {
    if (_expirydate.isAfter(DateTime.now())) {
      return _idToken;
    } else {
      return null;
    }
  }

  bool get isAuth {
    return token != null;
  }

  Future<void> signup(String email, String password) async {
    Uri url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyB7xZNF2E-ZTf9Iquart56mbayUs6p_kFo",
    );

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }

      _idToken = responseData["idToken"];
      userId = responseData["localId"];
      _expirydate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> forgotpass(String email) async {
    Uri url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyB7xZNF2E-ZTf9Iquart56mbayUs6p_kFo",
    );

    try {
      var response = await http.post(
        url,
        body: json.encode(
          {
            "requestType": "PASSWORD_RESET",
            "email": email,
          },
        ),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyB7xZNF2E-ZTf9Iquart56mbayUs6p_kFo",
    );

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }

      _idToken = responseData["idToken"];
      userId = responseData["localId"];
      _expirydate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
