import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:workout_pusher/chooseExercise.dart';
import 'package:workout_pusher/dayWorkouts.dart';
import 'package:workout_pusher/top3.dart';

class Top7Page extends StatefulWidget {
  @override
  _Top7PageState createState() => _Top7PageState();
}

class _Top7PageState extends State<Top7Page> {
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
                      MaterialPageRoute(builder: (context) => Top7Page()));
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
                  Text("Understand the rule? Pretty simple, right?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Hope you will help penguin grow by working out more!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                      child: Text(
                        "Let's start",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      // onPressed: addData),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseExercisePage()),
                          ))
                ]))
          ],
        )));
  }
}
