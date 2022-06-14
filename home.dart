import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:hexcolor/hexcolor.dart';

import 'addnote.dart';
import 'main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const hh());
}

class hh extends StatefulWidget {
  const hh({Key? key}) : super(key: key);

  @override
  _hhState createState() => _hhState();
}

class _hhState extends State<hh> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo app",
      theme: ThemeData(
        primaryColor: Colors.greenAccent[700],
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fb = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#7C1122"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => addnote(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Todo's",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: HexColor("#7C1122"),
      ),
      body: FirebaseAnimatedList(
        query: ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Color.fromARGB(156, 186, 143, 150),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[900],
                    ),
                    onPressed: () {
                      ref.child(snapshot.key!).remove();
                    },
                  ),
                  title: Text(
                    snapshot.value.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
