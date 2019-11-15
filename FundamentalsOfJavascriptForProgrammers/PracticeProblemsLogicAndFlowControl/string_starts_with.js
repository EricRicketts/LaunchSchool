function startsWith(str, searchString) {
  var searchStringLength = searchString.length;
  var matchString = '';

  for(var i = 0; i < searchStringLength; i++) {
    matchString += str[i];
  }

  return searchString === matchString;
}