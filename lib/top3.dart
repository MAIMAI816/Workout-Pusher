import 'package:flutter/material.dart';
import 'package:workout_pusher/top2.dart';
import 'package:workout_pusher/top4.dart';

class Top3Page extends StatefulWidget {
  @override
  _Top3PageState createState() => _Top3PageState();
}

class _Top3PageState extends State<Top3Page> {
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
                      MaterialPageRoute(builder: (context) => Top3Page()));
                },
              ),
            ]),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
                width: 350, child: Image.asset('assets/penguin/penguin.png')),
            Container(
                width: 300,
                alignment: Alignment.center,
                child: Column(children: [
                  Text(
                      "You have your own penguin living in this app and she will change depending on your workout performance.",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "The more you workout, penguin will be happier and willing to learn more things such as riding bikes, cooking, and programming...",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                      child: Text(
                        'Like this!',
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
                            MaterialPageRoute(builder: (context) => Top4Page()),
                          ))
                ]))
          ],
        )));
  }
}
