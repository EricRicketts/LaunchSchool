function substringsAtStart(string) {
  let tempStr = '';
  let subStrs = [];

  string.split('').forEach(function(char) {
    tempStr = tempStr.concat(char);
    subStrs.push(tempStr);
  });

  return subStrs;
}

// this alternate solution is the same as the Launch School solution
function substringsAtStartAlternate(string) {
  return string.split('').map(function(char, idx, arr) {
    return arr.slice(0, idx + 1).join('');
  });
}

export { substringsAtStart, substringsAtStartAlternate };