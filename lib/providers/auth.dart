import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  final googlesignin = GoogleSignIn();
  var _idToken, userId, _username;

  String? get token {
    return _idToken;
  }

  String? get usernamedata {
    if (_username == null) {
      return _username;
    } else {
      return _username;
    }
  }

  String? get uidtoken {
    return userId;
  }

  bool get isAuth {
    return token != null;
  }

  GoogleSignInAccount? _user;

  GoogleSignInAccount? get user => _user;

  Future<void> googleLogin() async {
    final googleUser = await googlesignin.signIn();

    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    _idToken = credential.idToken!;
    print(_idToken);
    userId = FirebaseAuth.instance.currentUser!.uid;

    notifyListeners();
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

      // _expirydate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(responseData["expiresIn"]),
      //   ),
      // );
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

      // _expirydate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(responseData["expiresIn"]),
      //   ),
      // );

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> update(String username) async {
    Uri url = Uri.parse(
      "https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyB7xZNF2E-ZTf9Iquart56mbayUs6p_kFo",
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

      print(_idToken);
      print(_username);
      // _expirydate = DateTime.now().add(
      //   Duration(
      //     seconds: int.parse(responseData["expiresIn"]),
      //   ),
      // );

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
