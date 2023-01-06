import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class page_1 extends StatefulWidget {
  const page_1({super.key});

  @override
  State<page_1> createState() => _page_1State();
}

class _page_1State extends State<page_1> {
  List<String> docsId = [];
  void getDocumentID() async {
    await FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        setState(() {
          docsId.add(element.reference.id);
          print(element.reference.id);
        });
      });
    });
  }

  Future AddUserData(Map<String, dynamic> userdata) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add(userdata)
        .then((value) => print('Add Success'));
  }

  @override
  void initState() {
    super.initState();
    getDocumentID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Homepage'),
        ),
        body: ListView.builder(
          itemCount: docsId.length,
          itemBuilder: (context, index) {
            CollectionReference usersdata =
                FirebaseFirestore.instance.collection('users');
            return FutureBuilder<DocumentSnapshot>(
              future: usersdata.doc(docsId[index]).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // ignore: prefer_const_constructors
                  return Center(
                    child: const Icon(
                      Icons.info,
                      color: Colors.red,
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting)
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                else {
                  var data = snapshot.data;
                  return data == null
                      ? const Center(
                          child: Text('No data...'),
                        )
                      : Card(
                          child: ListTile(
                            onTap: () {},
                            trailing: Text('${data['sex'].toString()}'),
                            leading: CircleAvatar(
                                child: Text(data['id'].toString())),
                            title: Text(data['name'].toString()),
                          ),
                        );
                }
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await AddUserData({
              'id': DateTime.now().microsecond,
              'name': 'ggggg',
              'sex': 'fff'
            });
          },
          child: Icon(Icons.add),
        ));
  }
}



// Future addDataToFireStore(
  //     {String? id, String? name, String? price, String? logo}) async {
  //   Map<String, dynamic> mapDate = {
  //     'id': id,
  //     'name': name,
  //     'price': double.parse(price.toString()),
  //     'logo': logo
  //   };
  //   await FirebaseFirestore.instance
  //       .collection('Conins')
  //       .add(mapDate)
  //       .then((value) => {});
  // }