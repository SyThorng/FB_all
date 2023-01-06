import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class page_2 extends StatelessWidget {
  const page_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(FirebaseAuth.instance.currentUser!.displayName!),
          Text(FirebaseAuth.instance.currentUser!.email!)
        ],
      ),
    );
  }
}
