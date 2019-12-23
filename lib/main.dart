import 'package:flutter/material.dart';
import 'package:workout_pusher/camera_screen.dart';
import 'package:workout_pusher/penguin.dart';
import 'package:workout_pusher/timeline.dart';
import 'package:workout_pusher/workouts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var workouts = [
      new Workouts('Push-up', 3, 30, 100, false),
      new Workouts('Crunch', 3, 30, 100, false),
      new Workouts('Dumobell rows', 3, 30, 100, false),
      new Workouts('Squats', 3, 30, 100, false)
    ];

    Widget buildRow(workout) {
      bool selected = workout.selected;
      return Card(
          child: ListTile(
        onTap: () {
          setState(() {
            print(workout.selected);
            if (selected) {
              selected = false;
              print(selected);
            } else {
              selected = true;
              print(selected);
            }
          });
        },
        title: Text(workout.title),
        subtitle: Text(
            workout.numOfSets.toString() +
                ' sets ' +
                workout.sets.toString() +
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
        nextScreen = MyHomePage();
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
          title: Text(widget.title),
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
      body: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return buildRow(workouts[index]);
        },
      ),
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
}
