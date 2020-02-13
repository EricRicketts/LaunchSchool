function searchWord(str, text) {
  let regexStr = '\\b' + `${str.toLowerCase()}` + '\\b';
  let regex = new RegExp(regexStr, 'g');

  return text.toLowerCase().match(regex).length;
}

export { searchWord };