function fridayThe13ths(year) {
  let months = [
    'January', 'February', 'March', 'April', 'May',
    'June', 'July', 'August', 'September', 'October',
    'November', 'December'
  ];

  return months.reduce((count, month) => {
    let dateString = `${month} 13, ${year}`;
    let date = new Date(dateString);
    return date.getDay() === 5 ? (count + 1) : count;
  }, 0);
}

export { fridayThe13ths };