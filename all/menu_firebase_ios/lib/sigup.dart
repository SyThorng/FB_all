import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class sigup extends StatefulWidget {
  const sigup({super.key});

  @override
  State<sigup> createState() => _sigupState();
}

class _sigupState extends State<sigup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();
    TextEditingController cfController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Register',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pwController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cfController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'comfire password'),
            ),
          ),
          MaterialButton(
            onPressed: () {
              sigup();
            },
            color: Colors.blue,
            child: Text('Register'),
          )
        ],
      ),
      backgroundColor: Colors.grey,
    );
  }
}
