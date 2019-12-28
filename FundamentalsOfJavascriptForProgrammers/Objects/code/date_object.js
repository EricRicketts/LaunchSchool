function dateSuffix(dayOfMonth) {
  dayOfMonth = dayOfMonth.toString();
  var mapToSuffix = {
    0: 'th', 1: 'st', 2: 'nd', 3: 'rd', 4: 'th',
    5: 'th', 6: 'th', 7: 'th', 8: 'th', 9: 'th',
  };

  var secondDigit = dayOfMonth[dayOfMonth.length - 1];
  var firstDigit = dayOfMonth[dayOfMonth.length - 2];

  return firstDigit === '1' ? 'th' : mapToSuffix[secondDigit];
}

function formattedDate(yearMonthDay) {
  return "Today's date is " + formattedDayOfWeek(yearMonthDay.getDay()) +
    ", " + formattedMonth(yearMonthDay.getMonth()) + " " +
    formattedDay(yearMonthDay.getDate()) + " " + yearMonthDay.getFullYear();
}

function formattedDay(dayOfMonth) {
  return dayOfMonth.toString() + dateSuffix(dayOfMonth);
}

function formattedDayOfWeek(dayOfWeek) {
  var daysOfWeek = [
    'Sunday', 'Monday', 'Tuesday', 'Wednesday',
    'Thursday', 'Friday', 'Saturday'
  ];
  return daysOfWeek[dayOfWeek];
}

function formattedMonth(monthDigit) {
  var months = [
    'January', 'Februrary', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  return months[monthDigit];
}

function range(start, stop, step) {
  return Array.from({ length: (stop - start)/step + 1 }, function(_, i) {
    return start + (i * step);
  });
};

export { dateSuffix, formattedDate, formattedDay,
  formattedDayOfWeek, formattedMonth, range };
