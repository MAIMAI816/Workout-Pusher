const functions = require("firebase-functions");
var mysql = require("./mysql.js");

module.exports = function(e) {
  e.getExercises = functions.https.onCall((data, context) => {
    return new Promise((resolve, reject) => {
      var sql = "SELECT * FROM exercises";
      console.log(mysql);
      mysql.query(sql, [], (err, result) => {
        if (err) {
          reject(err);
        }
        resolve(JSON.stringify(result));
      });
    });
  });
};
