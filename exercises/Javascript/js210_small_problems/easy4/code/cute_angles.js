function dms(degreeNumber) {
  const DEGREE_CHARCODE = 176;
  const DEGREES_IN_CIRCLE = 360;
  const MINUTES_IN_DEGREE = 60;
  const SECONDS_IN_MINUTE = 60;
  var degrees;
  var minutes;
  var seconds;

  [degrees, minutes] = integerAndFractionalParts(degreeNumber);
  degrees = degrees % DEGREES_IN_CIRCLE;
  minutes = minutes * MINUTES_IN_DEGREE;
  [minutes, seconds] = integerAndFractionalParts(minutes);
  minutes = minutes < 10 ? '0' + String(minutes) : minutes;
  seconds = Math.floor(seconds * SECONDS_IN_MINUTE);
  seconds = seconds < 10 ? '0' + String(seconds) : seconds;

  minutes = minutes === 0 ? "00'" : String(minutes) + "'";
  seconds = seconds === 0 ? '00"' : String(seconds) + '"';

  return String(degrees) + String.fromCharCode(DEGREE_CHARCODE) + minutes + seconds;
}

function integerAndFractionalParts(number) {
  var intValue = Math.floor(number);
  var fracValue = number - intValue;

  return [intValue, fracValue];
}

export { dms };