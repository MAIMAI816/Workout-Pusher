import 'package:flutter/material.dart';
import 'package:workout_pusher/top2.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
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
                      MaterialPageRoute(builder: (context) => TopPage()));
                },
              ),
            ]),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
                width: 350,
                child: Image.asset('assets/penguin/christmas_penguin.png')),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 300,
                alignment: Alignment.center,
                child: Column(children: [
                  Text(
                      "Merry Christmas, Ben! This is an app to encourage you to workout more often!",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(
                      "You can journal your exercise, upload photo of you to track how much your body changed.",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                      child: Text(
                        'Learn more',
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
                            MaterialPageRoute(builder: (context) => Top2Page()),
                          ))
                ]))
          ],
        )));
  }
}
