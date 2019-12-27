import 'package:workout_pusher/workouts.dart';

class DayWorkout {
  DateTime date;
  List<Workouts> workouts;
  String imgUrl;
  DayWorkout(this.date, this.workouts, this.imgUrl);
}
