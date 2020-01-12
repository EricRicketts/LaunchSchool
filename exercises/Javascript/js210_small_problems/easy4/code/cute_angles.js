function calculateDegreesMinutesFractionalSeconds(degreesDecimalFormat) {
  const DEGREE_CHARCODE = 176;
  const DEGREES_IN_CIRCLE = 360;
  const MINUTES_IN_DEGREE = 60;
  var degrees, minutes, seconds;

  [degrees, minutes] = integerAndFractionalParts(degreesDecimalFormat);
  degrees = String(degrees % DEGREES_IN_CIRCLE) + String.fromCharCode(DEGREE_CHARCODE);
  minutes = minutes * MINUTES_IN_DEGREE;

  [minutes, seconds] = integerAndFractionalParts(minutes);
  minutes = formatMinutes(minutes);

  return [degrees, minutes, seconds];

}

function dms(degreeNumber) {
  var degrees, minutes, seconds;
  
  [degrees, minutes, seconds] = calculateDegreesMinutesFractionalSeconds(degreeNumber);
  seconds = formatSeconds(seconds);

  return degrees + minutes + seconds;
}

function formatMinutes(minutes) {
  const MINUTES_SUFFIX = "'";

  if (minutes === 0) {
    minutes = "00'"
  } else if (minutes > 0 && minutes < 10) {
    minutes = '0' + String(minutes) + MINUTES_SUFFIX;
  } else {
    minutes = String(minutes) + MINUTES_SUFFIX;
  }

  return minutes;
}

function formatSeconds(seconds) {
  const SECONDS_IN_MINUTE = 60;
  const SECONDS_SUFFIX = '"';
  seconds = Math.floor(seconds * SECONDS_IN_MINUTE);

  if (seconds === 0) {
    seconds = '00"';
  } else if (seconds > 0 && seconds < 10) {
    seconds = '0' + String(seconds) + SECONDS_SUFFIX;
  } else {
    seconds = String(seconds) + SECONDS_SUFFIX;
  }

  return seconds;
}
function integerAndFractionalParts(number) {
  var intValue = Math.floor(number);
  var fracValue = number - intValue;

  return [intValue, fracValue];
}

export { dms };