function collectEvenNumbersTo(last) {
  var arr = [...Array(last).keys()].map(n => n + 1);
  return arr.filter(n => isEven(n));
}

function collectOddNumbersTo(last) {
  var arr = [...Array(last).keys()].map(n => n + 1);
  return arr.filter(n => isOdd(n));
}

function isEven(n) {
  return (n % 2 === 0);
}

function isOdd(n) {
  return (n % 2 === 1);
}

function roomArea(width, length) {
  var SQ_METERS_TO_SQ_FEET = 10.7639;
  var area_sq_meters = (width * length).toFixed(2);
  var area_sq_feet = (area_sq_meters * SQ_METERS_TO_SQ_FEET).toFixed(2);

  return 'The area of the room is ' + area_sq_meters +
  ' square meters ' + '(' + area_sq_feet + ' square feet).';
}

function tipCalculator(bill, percentTip) {
  var tip = (percentTip/100 * bill);
  var total = (bill + tip).toFixed(2);

  return 'The tip is $' + tip.toFixed(2) + '.' + '\n' +
    'The total is $' + total + '.';
}