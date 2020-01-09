function isPalindrome(str) {
 return str === str.slice().split('').reverse().join('');
}

function isRealPalindrome(str) {
 var lowerCase = str.toLowerCase();
 var nonAlphaNumRegex = /[^a-z0-9]/;
 var alphaNumericOnly = lowerCase.replace(nonAlphaNumRegex, '');

 return isPalindrome(alphaNumericOnly);
}

export { isPalindrome, isRealPalindrome };