import 'package:flutter/material.dart';
import 'package:workout_pusher/top5.dart';

class Top4Page extends StatefulWidget {
  @override
  _Top4PageState createState() => _Top4PageState();
}

class _Top4PageState extends State<Top4Page> {
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
                      MaterialPageRoute(builder: (context) => Top4Page()));
                },
              ),
            ]),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("I am so happy that I feel like dancing!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 350,
                child: Image.asset('assets/penguin/happy_penguin.png')),
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
                            MaterialPageRoute(builder: (context) => Top5Page()),
                          ))
                ]))
          ],
        )));
  }
}
