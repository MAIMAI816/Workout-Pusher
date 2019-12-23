const functions = require("firebase-functions");
var mysql = require("./mysql.js");

module.exports = function(e) {
  e.getDayWorkoutData = functions.https.onCall((data, context) => {
    return new Promise((resolve, reject) => {
      var sql = "SELECT * FROM day_workouts";
      mysql.query(sql, (err, result) => {
        if (err) {
          console.log("error ", err);
          reject(err);
        }
        resolve(JSON.stringify(results));
      });
    });
  });
};
