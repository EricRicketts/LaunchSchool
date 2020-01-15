function repeater(str) {
  var charArr = str.split('');
  var repeatedStr = '';

  charArr.forEach(function(char) {
    repeatedStr += char.repeat(2);
  });

  return repeatedStr;
}

export { repeater };