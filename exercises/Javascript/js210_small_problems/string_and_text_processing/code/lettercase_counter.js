function letterCaseCount(str) {
  let initialCount = { lowercase: 0, uppercase: 0, neither: 0 };

  return str.split('').reduce(function(countObj, char) {
    if (isUpper(char)) {
     countObj.uppercase += 1;
    } else if (isLower(char)) {
      countObj.lowercase += 1;
    } else {
      countObj.neither += 1;
    }

    return countObj;
  }, initialCount);
}

function letterCaseCountLaunchSchool(str) {
  const UPPERCASE = /[A-Z]/g;
  const LOWERCASE = /[a-z]/g;
  const NEITHER = /[^a-z]/gi;

  let upperCaseCount = str.match(UPPERCASE) || [];
  let lowerCaseCount = str.match(LOWERCASE) || [];
  let neitherCount = str.match(NEITHER) || [];

  return {
    lowercase: lowerCaseCount.length,
    uppercase: upperCaseCount.length,
    neither: neitherCount.length,
  }
}

function isLower(char) {
  const LOWER = /[a-z]/;
  return !!char.match(LOWER);
}

function isUpper(char) {
  const UPPER = /[A-Z]/;
  return !!char.match(UPPER);
}

export { letterCaseCount, letterCaseCountLaunchSchool };