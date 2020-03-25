var TODAY = toDate("2018-08-05");

function toDate(string) {
  return new Date(string + "T00:00:00");
}

function toString(date) {
  return date.getYear() + "-"
    + date.getMonth() + "-"
    + date.getDay();
}

function toStringFixed(date) {
  return date.getFullYear() + "-"
    + ('0' + (date.getMonth() + 1)).slice(-2) + "-"
    + ('0' + date.getDate()).slice(-2);
}

function isInThePast(date) {
  return date < TODAY;
}

function isWeekday(date) {
  return date.getDay() >= 1 &&
    date.getDay() <= 5;
}

function getCompatibleEvents(classes, calendar) {
  function isAvailable(date) {
    var dateStr = toString(date);
    return !calendar[dateStr] || calendar[dateStr].length === 0;
  };

  var compatibleClasses = [];

  Object.keys(classes).forEach(function(className) {
    var classDates = classes[className].map(toDate);

    if (classDates.some(isInThePast)) {
      return;
    }

    if (classDates.filter(isWeekday).every(isAvailable)) {
      compatibleClasses.push(className);
    }
  });

  return compatibleClasses;
}

function getCompatibleEventsFixed(classes, calendar) {
  function isAvailable(date) {
    var dateStr = toStringFixed(date);
    return !calendar[dateStr] || calendar[dateStr].length === 0;
  };

  var compatibleClasses = [];

  Object.keys(classes).forEach(function(className) {
    var classDates = classes[className].map(toDate);

    if (classDates.some(isInThePast)) {
      return;
    }

    if (classDates.filter(isWeekday).every(isAvailable)) {
      compatibleClasses.push(className);
    }
  });

  return compatibleClasses;
}

export { getCompatibleEvents, getCompatibleEventsFixed };
/*
The main problem is the toString function, getMonth returns a number
between 0 and 11 inclusive so we had to add 1 to the result and then
pad with '0' so the first 9 months would be prefixed with a '0'.

getDay() returns a number between 0 and 6 so the proper function is
getDate() which returns a number between 1 and 31, again we had to pad
with '0' for the first 9 days of the month.

For string operations (string).slice(-2) takes the last two characters
of the string.
 */