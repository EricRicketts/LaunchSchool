function mailCount(emailData) {
  let results = {
    emailCount: '',
    dateRange: '',
  };
  let numberOfEmails = emailData.split(/##\|\|##/).length;
  results.emailCount = 'Count of Email: ' + numberOfEmails;

  let dateStrings = emailData.match(/(?<=Date:).*(?=#\/#)/g);
  let dateObjects = dateStrings.map((dateString) => new Date(dateString) );
  let sortedDates = dateObjects.sort(function(dateOne, dateTwo) {
    return dateOne.valueOf() - dateTwo.valueOf();
  });

  let earliestDate = sortedDates[0];
  let latestDate = sortedDates[sortedDates.length - 1];

  results.dateRange = 'Date Range: ' + earliestDate.toDateString() + ' - ' + latestDate.toDateString();

  return results;
}

export { mailCount };