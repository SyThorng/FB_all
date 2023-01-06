import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signin_2/page_1.dart';
import 'package:signin_2/page_2.dart';

class AuthService_1 {
  // 1.handleAuthState()

  //2.signinWithGoogle()

  //3.signOut
  // Determine if the user is authenticated

  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext, snapshot) {
        if (snapshot.hasData) {
          return const page_1();
        } else {
          return const page_2();
        }
      },
    );
  }
}

SingInWithGoogle() async {
  final GoogleSignInAccount? googleUser =
      await GoogleSignIn(scopes: <String>["email"]).signIn();

  final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
  final Credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  return FirebaseAuth.instance.signInWithCredential(Credential);
}

Singout() {
  FirebaseAuth.instance.signOut();
}
