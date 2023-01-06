import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:menu_firebase_ios/show.dart';
import 'package:menu_firebase_ios/sigup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  void input() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: pwController.text.trim())
          .then((value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => show(),
            ),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pwController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () async {
              input();
            },
            color: Colors.blue,
            child: Text('Login'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('don\'t have an account'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => sigup(),
                        ));
                  },
                  child: Text('Register'))
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 60),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       MaterialButton(
          //         onPressed: () {},
          //         color: Colors.blue,
          //         child: Text('Login with Facebook'),
          //       ),
          //       MaterialButton(
          //         onPressed: () {},
          //         color: Colors.blue,
          //         child: Text('Login with google'),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
      backgroundColor: Colors.grey,
    );
  }
}
