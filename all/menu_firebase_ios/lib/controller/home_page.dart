import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menu_firebase_ios/controller/class.dart';

class home_page extends StatelessWidget {
  home_page({super.key});

  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return Text('Firebase Auth');
  }

  Widget _userid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return MaterialButton(
      onPressed: signOut,
      child: Text('Sign Out'),
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Center(child: _userid()), _signOutButton()],
      ),
    );
  }
}
