function longestSentence(text) {
  const SEPARATOR= /([.?!])\s+/;
  const DELIMITER = /(?<=[.?!]\s+)/g; // positive lookbehind on the ending punctuation for a sentence

  let sentences = text.split(DELIMITER).map((sentence) => {
    return sentence.replace(SEPARATOR, '$1');
  });

  sentences.sort(function(sentenceOne, sentenceTwo) {
    return sentenceTwo.split(/\s+/).length - sentenceOne.split(/\s+/).length;
  }); // sort descending

  let longestSentence = sentences[0];
  let longestSentenceWordCount = longestSentence.split(/\s+/).length;

  return longestSentence + '\n' +
    'The longest sentence has ' + longestSentenceWordCount + ' words.';
}

export { longestSentence };