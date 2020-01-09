function isPalindrome(str) {
 return str === str.slice().split('').reverse().join('');
}

export { isPalindrome };