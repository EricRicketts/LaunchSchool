function capitalize(str) {
  let regex = /\b([a-z])/gi;
  let replacer = function(match, p1) {
    return p1.toUpperCase();
  };

  return str.replace(regex, replacer);
}

function countWordInText(str, text) {
  let strRegex = '\\b' + str + '\\b';
  let regex = new RegExp(strRegex, 'g');

  return text.match(regex).length;
}

export { capitalize, countWordInText };