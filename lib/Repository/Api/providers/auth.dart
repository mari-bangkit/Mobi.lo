import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  var _idToken, userId, _username, _email;

  String? get token {
    return _idToken;
  }

  String? get usernamedata {
    if (_username == '') {
      return _username = "User";
    } else {
      return _username;
    }
  }

  String? get email {
    return _email;
  }

  String? get uidtoken {
    return userId;
  }

  bool get isAuth {
    return token != null;
  }

  Future<void> signup(String email, String password) async {
    Uri url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCCHSZWkE9OT7Mgi_K0hNJcnfVUjQCGg4w",
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

      // _expirydate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(responseData["expiresIn"]),
      //   ),
      // );
    } catch (error) {
      rethrow;
    }
  }

  Future<void> forgotpass(String email) async {
    Uri url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyCCHSZWkE9OT7Mgi_K0hNJcnfVUjQCGg4w",
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
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCCHSZWkE9OT7Mgi_K0hNJcnfVUjQCGg4w",
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
      if (kDebugMode) {
        print(responseData);
      }
      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }

      _idToken = responseData["idToken"];
      userId = responseData["localId"];
      _username = responseData["displayName"];
      _email = responseData["email"];

      print(_idToken);
      // _expirydate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(responseData["expiresIn"]),
      //   ),
      // );

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> update(String username) async {
    Uri url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyCCHSZWkE9OT7Mgi_K0hNJcnfVUjQCGg4w",
    );

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "idToken": _idToken,
          "displayName": username,
          "deleteAttribute": "PHOTO_URL",
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }

      _idToken = _idToken;
      userId = responseData["localId"];
      _username = responseData["displayName"];

      // _expirydate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(responseData["expiresIn"]),
      //   ),
      // );

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
