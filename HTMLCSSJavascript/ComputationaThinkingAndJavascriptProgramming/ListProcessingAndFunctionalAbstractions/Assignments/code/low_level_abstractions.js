function isAllUnique(string) {
  let compareArray = [];
  let noRepeats = true;
  let noSpacesString =  string.replace(/\s+/, '');
  let charArray = noSpacesString.toLowerCase().split('');
  let charArrayLength = charArray.length;

  for (let i = 0; i < charArrayLength; i += 1) {
    if (compareArray.includes(charArray[i])) {
      noRepeats = false;
      break;
    } else {
      compareArray.push(charArray[i]);
    }
  }

  return noRepeats;
}

export { isAllUnique };