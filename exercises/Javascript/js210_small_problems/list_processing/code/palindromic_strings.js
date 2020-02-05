import { substrings } from "./all_substrings";

function isPalindrome(str) {
  let reversedStr = str.split('').reverse().join('');
  return str.length > 1 && str === reversedStr;
}
function palindromes(str) {
  return substrings(str).filter(isPalindrome);
}

export { palindromes };