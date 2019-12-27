import 'package:flutter/material.dart';
import 'package:workout_pusher/top3.dart';

class Top2Page extends StatefulWidget {
  @override
  _Top2PageState createState() => _Top2PageState();
}

class _Top2PageState extends State<Top2Page> {
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
                      MaterialPageRoute(builder: (context) => Top2Page()));
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
                      "Well, you might be thinking, there is so many workout app out there that you can do the same thing. ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Rest assured! We have a great compelling feature just for you. ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                      child: Text(
                        'Learn more',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Top3Page()),
                          ))
                ]))
          ],
        )));
  }
}
