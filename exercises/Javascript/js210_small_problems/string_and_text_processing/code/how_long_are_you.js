function wordLengths(str) {
  if (str === undefined || str === '') { return []; }
  return str.split(/\s+/).reduce(function(wordLengths, word) {
    let wordAndLetterCount = word + ' ' + word.length;
    wordLengths.push(wordAndLetterCount);
    return wordLengths;
  }, []);
}

function wordLengthsLaunchSchool(str) {
  if (arguments.length === 0 || str.length === 0) { return []; }
  return str.split(/\s+/).map(function(word) {
    return word + ' ' + word.length;
  });
}

export { wordLengths, wordLengthsLaunchSchool };
/*
I included the Launch School solution because it was better
than mine, the guard clause is more robust and I forgot that
splitting a string returns an array, then I could have just
mapped the result instead of using reduce, which meant I had
to populate a new array instead of modifying the current one
 */