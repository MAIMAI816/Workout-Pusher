const functions = require("firebase-functions");
var mysql = require("mysql");

module.exports.query = function(sql = "", par = [], callback) {
  // var con = mysql.createConnection({
  //   host: "workout-pusher-263101:us-central1:workout-pusher",
  //   user: "root",
  //   password: "mai",
  //   database: "workout-pusher"
  // });

  // var mode = "localno";

  //リモート環境の場合
  const connectionName = "workout-pusher:us-central1:workout-pusher";
  const dbUser = "mai";
  const dbPassword = "kerochi";
  const dbName = "workout-pusher";

  const mysqlConfig = {
    connectionLimit: 1,
    user: dbUser,
    password: dbPassword,
    database: dbName
  };

  if (process.env.NODE_ENV === "production") {
    mysqlConfig.socketPath = `/cloudsql/${connectionName}`;
  }

  let mysqlPool;

  if (!mysqlPool) {
    mysqlPool = mysql.createPool(mysqlConfig);
  }

  mysqlPool.query(sql, par, (err, results) => {
    if (err) {
      //console.error(err);
      //res.status(500).send(err);
      //reject(err);
      return callback(err, null);
    } else {
      //res.send(JSON.stringify(results));
      //resolve(results);
      return callback(null, results);
    }
  });

  // con.connect(function(err) {
  //   if (err) throw err;
  //   console.log("Connected!");
  //   con.query(sql, function(err, results) {
  //     if (err) {
  //       //console.error(err);
  //       //res.status(500).send(err);
  //       //reject(err);
  //       return callback(err, null);
  //     } else {
  //       //res.send(JSON.stringify(results));
  //       //resolve(results);
  //       return callback(null, results);
  //     }
  //   });
};
