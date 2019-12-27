import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:workout_pusher/dayWorkouts.dart';
import 'package:workout_pusher/main.dart';
import 'package:workout_pusher/penguin.dart';
import 'package:workout_pusher/workouts.dart';

class TimelinePage extends StatefulWidget {
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  int _currentIndex = 0;
  List<DayWorkout> dayWorkouts = [];

  Future<List<DocumentSnapshot>> _getWorkoutDataFromDB() async {
    CollectionReference ref = Firestore.instance.collection('dayWorkouts');
    QuerySnapshot eventsQuery = await ref.orderBy('date').getDocuments();
    return eventsQuery.documents;
  }

  void initState() {
    _getWorkoutData();
  }

  Future<Widget> _getImage(path) async {
    Image image;
    await FirebaseStorage.instance
        .ref()
        .child(path)
        .getDownloadURL()
        .then((downloadUrl) {
      image = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });

    return image;
  }

  void _navigateToScreens(index) {
    var nextScreen;
    print(index);
    if (index == 0) {
      nextScreen = MyHomePage();
    } else if (index == 1) {
      nextScreen = TimelinePage();
    } else if (index == 2) {
      nextScreen = PenguinPage();
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => nextScreen));
  }

  Widget buildRow(dayWorkout) {
    print(dayWorkouts);
    return Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(dayWorkout.date,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
      ),
      FutureBuilder(
          future: _getImage(dayWorkout.imgUrl),
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.done)
              return Container(
                child: snapshot.data,
              );

            if (snapshot.connectionState == ConnectionState.waiting)
              return Container(child: CircularProgressIndicator());

            return Container();
          }),
      Container(
        height: 150,
        child: _myListView(context, dayWorkout.workouts),
      )
    ]));
  }

  _getWorkoutData() async {
    await _getWorkoutDataFromDB().then((documents) {
      List<Workouts> workouts;
      documents.forEach((document) {
        // document['workouts'].forEach((workout) {
        //   print(workout.get.then((data1) {
        //     data1.forEach((data) {
        //       print(data);
        //     });
        //   }));
        //   print(workout.toString());
        //   // workouts.add(new Workouts(workout['title'], workout['numOfSets'],
        //   //     workout['sets'], workout['weight'], false));
        // });
        dayWorkouts.add(new DayWorkout(
            document['date'].toString(), [], document['imgUrl']));
      });
    });

    return ListView.builder(
        itemCount: dayWorkouts.length,
        itemBuilder: (context, index) {
          return buildRow(dayWorkouts[index]);
        });
  }

  Widget _myListView(BuildContext context, List<Workouts> workouts) {
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(children: [
              Text(workouts[index].title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(width: 10),
              Text(
                  workouts[index].numOfSets.toString() +
                      ' sets ' +
                      workouts[index].sets.toString() +
                      ' reps ' +
                      workouts[index].weight.toString() +
                      ' lbs',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300)),
            ]),
          ),
        ]);
      },
    );
  }

  // [
  //   new DayWorkout(
  //       'December 16th',
  //       [
  //         new Workouts('Push-up', 3, 30, 100, false),
  //         new Workouts('Crunch', 3, 30, 100, false),
  //         new Workouts('Dumobell rows', 3, 30, 100, false),
  //         new Workouts('Squats', 3, 30, 100, false)
  //       ],
  //       '20191222.JPG'),
  //   new DayWorkout(
  //       'December 17th',
  //       [
  //         new Workouts('Push-up', 3, 30, 100, false),
  //         new Workouts('Crunch', 3, 30, 100, false),
  //         new Workouts('Dumobell rows', 3, 30, 100, false),
  //         new Workouts('Squats', 3, 30, 100, false)
  //       ],
  //       '20191222.JPG'),
  //   new DayWorkout(
  //       'December 20th',
  //       [
  //         new Workouts('Push-up', 3, 30, 100, false),
  //         new Workouts('Crunch', 3, 30, 100, false),
  //         new Workouts('Dumobell rows', 3, 30, 100, false),
  //         new Workouts('Squats', 3, 30, 100, false)
  //       ],
  //       '20191222.JPG'),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Timeline'),
        ),
        body: FutureBuilder(
            future: _getWorkoutData(),
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
                    return new Text('Result: ${snapshot.data}');
              }
            }));
  }
}
