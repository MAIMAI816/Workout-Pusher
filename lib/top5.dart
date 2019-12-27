import 'package:flutter/material.dart';
import 'package:workout_pusher/top3.dart';
import 'package:workout_pusher/top6.dart';

class Top5Page extends StatefulWidget {
  @override
  _Top5PageState createState() => _Top5PageState();
}

class _Top5PageState extends State<Top5Page> {
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
                      MaterialPageRoute(builder: (context) => Top5Page()));
                },
              ),
            ]),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            // Container(
            //     width: 350,
            //     child: Image.asset('assets/penguin/christmas_penguin.png')),
            SizedBox(
              height: 100,
            ),
            Container(
                width: 300,
                alignment: Alignment.center,
                child: Column(children: [
                  Text(
                      "Well, You might be wondering....What if I don't work out???",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Watch out. Penguin will be really sad and not be willing to talk to you. ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                      child: Text(
                        'Like this',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Top6Page()),
                          ))
                ]))
          ],
        )));
  }
}
