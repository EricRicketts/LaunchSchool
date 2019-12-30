function endpointChecksAndCorrections (start, end, strSize) {
  if (end === undefined ) { end = strSize; }
  if (isNaN(Number(start)) || start < 0) { start = 0; }
  if (isNaN(Number(end)) || end < 0) { end = 0; }

  return [start, end];

}

function normalizeStartAndEnd(start, end, strSize) {
  var temp;

  if (start > end) {
    temp = start;
    start = end;
    end = temp;
  }

  end = end > strSize ? strSize : end;

  return [start, end];
}

function substring(str, start, end) {
  var strSize = str.length;
  var subString = '';

  [start, end] = endpointChecksAndCorrections(start, end, strSize);
  [start, end] = normalizeStartAndEnd(start, end, strSize);

  for(var i = start; i < end; i++) { subString += str[i]; }

  return subString;
}