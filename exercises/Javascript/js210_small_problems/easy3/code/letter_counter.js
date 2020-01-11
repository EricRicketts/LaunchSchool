function countWords(wordSizes, word) {
  if (wordSizes[(word.length).toString()] === undefined) {
    wordSizes[(word.length).toString()] = 1;
  } else {
    wordSizes[(word.length).toString()] += 1;
  }
}
function wordSizesPartOne(phrase) {
 var wordSizes = {};
 var wordArr = phrase.split(/\s+/);

 if (phrase !== '') {
   wordArr.forEach(function(word) {
     countWords(wordSizes, word);
   });
 }
 return wordSizes;
}

function wordSizesPartTwo(phrase) {
  var regex = /[^a-zA-Z]/;
  var filteredPhrase = phrase.split(/\s+/).map((word) => word.replace(regex, '')).join(' ');

  return wordSizesPartOne(filteredPhrase);
}

export { wordSizesPartOne, wordSizesPartTwo };