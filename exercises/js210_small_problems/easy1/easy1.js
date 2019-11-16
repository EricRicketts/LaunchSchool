function collectEvenNumbersTo(last) {
  var arr = [...Array(last).keys()].map(n => n + 1);
  return arr.filter(n => isEven(n));
}

function collectOddNumbersTo(last) {
  var arr = [...Array(last).keys()].map(n => n + 1);
  return arr.filter(n => isOdd(n));
}

function displayStrings(s1, s2) {
  return s1 + s2 + s1;
}

function isEven(n) {
  return (n % 2 === 0);
}

function isLeapYear(year) {
  return ((year % 4 === 0) && (year % 100 !== 0)) || ((year % 100 === 0) && (year % 400 === 0));
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

function sumOrProductOfIntegersTo(n, operation) {
  var arr = [...Array(n).keys()].map(n => n + 1);
  var product, sum;
  var result = '';

  switch(operation) {
    case 'p':
      product = arr.reduce(function(product, num) { return product *= num; }, 1);
      result = 'The product of the integers between 1 and ' + n + ' is ' + product + '.';
      break;
    case 's':
      sum = arr.reduce(function(sum, num) { return sum += num; }, 0);
      result = 'The sum of the integers between 1 and ' + n + ' is ' + sum + '.';
      break;
    default:
      result = 'incorrect input.';
  }

  return result;
} 

function shortLongShort(str1, str2) {
  return str1.length <= str2.length ? displayStrings(str1, str2) : displayStrings(str2, str1);
}

function tipCalculator(bill, percentTip) {
  var tip = (percentTip/100 * bill);
  var total = (bill + tip).toFixed(2);

  return 'The tip is $' + tip.toFixed(2) + '.' + '\n' +
    'The total is $' + total + '.';
}