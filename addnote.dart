import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home.dart';
import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();

  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('todos');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos"),
        backgroundColor: HexColor("#7C1122"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Type Todo's",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: HexColor("#7C1122"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                ref
                    .push()
                    .set(
                      title.text,
                    )
                    .asStream();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
