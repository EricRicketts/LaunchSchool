function repeatedCharacters(str) {
  var charObj = {};
  var charArr = str.toLowerCase().split('');
  charArr.forEach(prop => {
    charObj[prop] = ++charObj[prop] || 1;
  });

  var entries = Object.entries(charObj);
  for (const [name, value] of entries) {
    if (value === 1) {
      delete charObj[name];
    }
  }

  return charObj;
}

export { repeatedCharacters };