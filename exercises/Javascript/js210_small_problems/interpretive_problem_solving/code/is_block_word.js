function isBlockWord(word) {
 const blockLetters = [
   'B:O', 'X:K', 'D:Q', 'C:P', 'N:A',
   'G:T', 'R:E', 'F:S', 'J:W', 'H:U',
   'V:I', 'L:Y', 'Z:M'
 ];

 return blockLetters.every((blockOfLetters) => {
   let letters = blockOfLetters.split(":");
   let regex = new RegExp(`${letters[0]}|${letters[1]}`, 'gi');

   let match = word.match(regex);
   return match === null || match.length < 2;
 });
}

export { isBlockWord };
/*
input: guaranteed to be a word consisting of letters which will be upper case, lower case, or a mix
output: boolean

1.  make an array of strings for the block letters
2.  Iterate through the block of letters, use the every Array method
3.  if the criteria is met, every returns true
4.  if the criteria is not met every return false

criteria:
1.  for each string, split on ":"
2.  form a regex /first|last/gi
3.  word.match(regex)
4.  true is when match < 2 meaning none or only 1 match
 */