import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:menu_firebase_ios/controller/class.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String? errorMessage = '';
  bool islogin = true;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  Future<void> signInwithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _pwController.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> CreateUserwithEmailAndPassword() async {
    try {
      await Auth().CreateUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _pwController.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return Text('Firebase Auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return MaterialButton(
      onPressed:
          islogin ? signInwithEmailAndPassword : CreateUserwithEmailAndPassword,
      child: Text(islogin ? 'Login' : 'Register'),
    );
  }

  Widget _LoginorRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          islogin = !islogin;
        });
      },
      child: Text(islogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('Email', _emailController),
            _entryField('password', _pwController),
            _errorMessage(),
            _submitButton(),
            _LoginorRegisterButton()
          ],
        ),
      ),
    );
  }
}
