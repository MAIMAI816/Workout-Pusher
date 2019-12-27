const functions = require("firebase-functions");
var mysql = require("./mysql.js");

//ビデオの通報
module.exports = function(e) {
  e.addDayWorkout = functions.https.onCall((data, context) => {
    return new Promise(function(resolve, reject) {
      var sql = "INSERT INTO day_workouts (date, imgUrl) VALUES (?,?)";

      mysql.query(sql, [data.date, data.imgUrl], function(err, results) {
        if (err) {
          console.log("エラー : ", err);
          reject(err);
        }
        console.log(results);
        resolve(results);
      });
    });
  });
};
