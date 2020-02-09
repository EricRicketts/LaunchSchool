function removeVowels(strArr) {
  const VOWELS = /[aeiou]/gi;
  return strArr.map((str) => str.replace(VOWELS, ''));
}

function removeVowelsLaunchSchool(strAry) {
  const VOWELS = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
  return strAry.map(function(str) {
    return str.split('').map(function(char) {
       if (VOWELS.indexOf(char) < 0) {
         return char;
       } else {
         return '';
       }
    }).join('');
  })
}
export { removeVowels, removeVowelsLaunchSchool };