const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
});

if (
  !process.env.FUNCTION_NAME ||
  process.env.FUNCTION_NAME === "getDayWorkoutData"
) {
  require("./getDayWorkoutData.js")(exports);
}

if (
  !process.env.FUNCTION_NAME ||
  process.env.FUNCTION_NAME === "getExercises"
) {
  require("./getExercises.js")(exports);
}

if (
  !process.env.FUNCTION_NAME ||
  process.env.FUNCTION_NAME === "addDayWorkout"
) {
  require("./addDayWorkout.js")(exports);
}
