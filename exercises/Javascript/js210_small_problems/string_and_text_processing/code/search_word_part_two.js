function searchWord(str, text) {
  let regexStr = '\\b' + `${str}` + '\\b';
  let regex = new RegExp(regexStr, 'gi');

  return text.replace(regex, '***' + str.toUpperCase() + '***');
}

export { searchWord };