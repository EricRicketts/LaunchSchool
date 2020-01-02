var MINUTES_PER_HOUR = 60;
var HOURS_PER_DAY = 24;
var MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;
var MILLISECONDS_PER_SECOND = 1000;
var SECONDS_PER_MINUTE = 60;

function afterMidnightWithDate(timeStr, afterMidnight = true) {
  var referenceDate;
  referenceDate = afterMidnight ? offsetDateByMilliseconds(timeStr) : offsetDateByMilliseconds(timeStr, false);

  return referenceDate.getUTCHours()*MINUTES_PER_HOUR + referenceDate.getUTCMinutes();
}

function afterMidnightWithoutDate(timeStr) {
  var timeComponents = timeStr.split(':');
  var hours = parseInt(timeComponents[0], 10);
  var minutes = parseInt(timeComponents[1], 10);

  return hours * MINUTES_PER_HOUR + minutes;
}

function beforeMidnightWithDate(timeStr) {
  return afterMidnightWithDate(timeStr, false);
}

function beforeMidnightWithoutDate(timeStr) {
  var deltaMinutes = MINUTES_PER_DAY - afterMidnightWithoutDate(timeStr);
  if (deltaMinutes === MINUTES_PER_DAY) {
    deltaMinutes = 0;
  }

  return deltaMinutes;
}

function offsetDateByMilliseconds(timeStr, afterMidnight = true) {
  var date = new Date('January 1 1970 00:00:00');
  var hours, minutes;
  [hours, minutes] = timeStr.split(':').map((str) => parseInt(str, 10) );
  var milliseconds = (hours*MINUTES_PER_HOUR*SECONDS_PER_MINUTE + minutes*SECONDS_PER_MINUTE)*MILLISECONDS_PER_SECOND;

  afterMidnight ? date.setTime(milliseconds): date.setTime(-milliseconds);

  return date;
}

export { afterMidnightWithoutDate, beforeMidnightWithoutDate,
  afterMidnightWithDate, beforeMidnightWithDate };
