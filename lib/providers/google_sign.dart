import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSign extends ChangeNotifier {
  final googlesignin = GoogleSignIn();
  late String userId;

  GoogleSignInAccount? _user;

  GoogleSignInAccount? get user => _user;

  Future googleLogin() async {
    final googleUser = await googlesignin.signIn();

    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    print(googleUser);

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    print(credential.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    print(FirebaseAuth.instance.currentUser!.email);
    notifyListeners();
  }
}