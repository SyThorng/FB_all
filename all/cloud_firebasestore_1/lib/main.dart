import 'package:cloud_firebasestore_1/page_1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: _getInitFirebase,
      // home: page_1(),
    );
  }
}

get _getInitFirebase {
  return FutureBuilder(
    future: Firebase.initializeApp(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Scaffold(
          body: Center(
            child: Icon(
              Icons.info,
              size: 35,
              color: Colors.red,
            ),
          ),
        );
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return const page_1();
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}
