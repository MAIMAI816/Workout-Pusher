var mysql = require("mysql");

exports.query = (sql = "", par = [], callback) => {
  var mode = "no-local";

  //リモート環境の場合
  if (mode !== "local") {
    const connectionName = "ec2-3-134-78-242.us-east-2.compute.amazonaws.com";
    const dbUser = "root";
    const dbPassword = "n";
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
  }
  //ローカル環境の場合
  else {
    var connection = mysql.createConnection({
      host: "34.69.70.83",
      user: "takuro",
      password: "yota357",
      database: "thatsme"
    });

    connection.connect();

    connection.query(sql, par, (err, results) => {
      if (err) return callback(err, null);
      //console.log(results);
      return callback(null, results);
    });
    connection.end();
  }
};
