function letterPercentages(str) {
  let lowerCaseRegex = /[a-z]/g;
  let upperCaseRegex = /[A-Z]/g;
  let nonAlphaRegex = /[^a-zA-Z]/g;
  let total_chars = str.length;

  let numberLowerCase = (str.match(lowerCaseRegex) || []).length;
  let numberUpperCase = (str.match(upperCaseRegex) || []).length;
  let numberNeither = (str.match(nonAlphaRegex) || []).length;

  return {
    lowercase: (numberLowerCase/total_chars * 100).toFixed(2),
    uppercase: (numberUpperCase/total_chars * 100).toFixed(2),
    neither: (numberNeither/total_chars * 100).toFixed(2),
  }
}

export { letterPercentages };