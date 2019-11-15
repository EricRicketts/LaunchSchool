function badLength(length) {
  return length <= 0;
}

function badStart(start, lastIndex) {
  return (start < 0 || start > lastIndex);
}

function normalizeLength(start, length, lastIndex) {
  if (start + length - 1 <= lastIndex) {
    return length;
  } else {
    return lastIndex - start + 1;
  }
}

function normalizeStart(str, start) {
  if (start < 0) {
    return start + str.length;
  } else {
    return start;
  }
}

function substr(str, start, length) {
  var lastIndex = str.length - 1;
  var subString = '';

  start = normalizeStart(str, start);

  if (badStart(start, lastIndex) || badLength(length)) { 
    return '';
  }

  length = normalizeLength(start, length, lastIndex);

  for(var i = start; i < start + length; i++) {
    subString += str[i];
  }

  return subString;
}