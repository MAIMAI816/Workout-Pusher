import 'package:flutter/material.dart';
import 'package:workout_pusher/top5.dart';
import 'package:workout_pusher/top7.dart';

class Top6Page extends StatefulWidget {
  @override
  _Top6PageState createState() => _Top6PageState();
}

class _Top6PageState extends State<Top6Page> {
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
                      MaterialPageRoute(builder: (context) => Top6Page()));
                },
              ),
            ]),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("I just wanna sit down",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Text("and I don't wanna leave my room",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 350,
                child: Image.asset('assets/penguin/angry_penguin.png')),
            Container(
                width: 300,
                alignment: Alignment.center,
                child: Column(children: [
                  FlatButton(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      // shape: RoundedRectangleBorder(
                      //     //borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Top7Page()),
                          ))
                ]))
          ],
        )));
  }
}
