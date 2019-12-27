import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:workout_pusher/camera_screen.dart';
import 'package:workout_pusher/penguin.dart';
import 'package:workout_pusher/timeline.dart';
import 'package:workout_pusher/workouts.dart';

class ChooseExercisePage extends StatefulWidget {
  @override
  _ChooseExercisePageState createState() => _ChooseExercisePageState();
}

class _ChooseExercisePageState extends State<ChooseExercisePage> {
  int _currentIndex = 0;
  List<Workouts> workouts = [];
  @override
  Widget build(BuildContext context) {
    _getExerciseData() async {
      final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
        functionName: 'getExercises',
      );

      //パラメーターを渡す
      dynamic resp = await callable.call(<String, dynamic>{
        'data': "d",
      });
      print('getworkout data called and response:');
      print(resp.data);
      var workoutsData = json.decode(resp.data);
      workoutsData.forEach((workout) {
        var workoutObj = new Workouts();
        print(workout['title']);
        workoutObj.title = workout['title'];
        workoutObj.rep = workout['rep'];
        workoutObj.sets = workout['sets'];
        workoutObj.weight = workout['weight'];
        workoutObj.selected = false;
        workouts.add(workoutObj);
      });
      return workouts;
    }

    Widget buildRow(workout) {
      bool selected = workout.selected;
      return Card(
          child: ListTile(
        onTap: () {
          setState(() {
            print(workout.selected);
            if (selected) {
              workout.selected = false;
              print(selected);
            } else {
              workout.selected = true;
              print(selected);
            }
          });
        },
        title: Text(workout.title),
        subtitle: Text(
            workout.sets.toString() +
                ' sets ' +
                workout.rep.toString() +
                ' reps ' +
                workout.weight.toString() +
                ' lbs',
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400)),
        trailing: Icon(
          selected ? Icons.check_circle : Icons.check_circle_outline,
          color: Colors.blue,
        ),
      ));
    }

    void onTabTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    void _navigateToScreens(index) {
      var nextScreen;
      print(index);
      if (index == 0) {
        nextScreen = ChooseExercisePage();
      } else if (index == 1) {
        nextScreen = TimelinePage();
      } else if (index == 2) {
        nextScreen = PenguinPage();
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => nextScreen));
    }

    return Scaffold(
      appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Choose your workout'),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.check, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraScreen()));
              },
            ),
          ]),
      body: FutureBuilder(
          future: _getExerciseData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Container();
              case ConnectionState.waiting:
                return new Text('Awaiting result...');
              default:
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                else
                  return ListView.builder(
                    itemCount: workouts.length,
                    itemBuilder: (context, index) {
                      return buildRow(workouts[index]);
                    },
                  );
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        onTap: ((int index) {
          setState(() {
            _currentIndex = index;
          });
          _navigateToScreens(index);
        }), // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.timeline),
            title: new Text('Timeline'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Penguin'),
          )
        ],
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }

  jsonDecode(data) {}
}
