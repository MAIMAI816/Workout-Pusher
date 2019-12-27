import 'package:flutter/material.dart';

class PenguinPage extends StatefulWidget {
  @override
  _PenguinPageState createState() => _PenguinPageState();
}

class _PenguinPageState extends State<PenguinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text(''),
            actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(Icons.check, color: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PenguinPage()));
                },
              ),
            ]),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("Today's your penguin",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            Container(
                width: 350,
                child: Image.asset('assets/penguin/neutral_penguin.png')),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              alignment: Alignment.center,
              child: Text(
                  "You  didn't work out today, but it's ok, because it's Christmas... But let's plan your next week workout schedule!",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            )
          ],
        )));
  }
}
