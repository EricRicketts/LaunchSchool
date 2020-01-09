function isPalindrome(str) {
 return str === str.slice().split('').reverse().join('');
}

function isPalindromicNumber(numbers) {
 var str = (numbers).toString();
 var nonNumRegex = /\D/;

 return str.search(nonNumRegex) === -1 ? isPalindrome(str) : false;
}

function isRealPalindrome(str) {
 var lowerCase = str.toLowerCase();
 var nonAlphaNumRegex = /[^a-z0-9]/;
 var alphaNumericOnly = lowerCase.replace(nonAlphaNumRegex, '');

 return isPalindrome(alphaNumericOnly);
}

export { isPalindrome, isRealPalindrome, isPalindromicNumber };