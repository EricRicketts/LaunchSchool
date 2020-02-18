function getOverallSentiment(positiveWords, negativeWords) {
  if (positiveWords.length > negativeWords.length) {
    return 'The sentiment of the text is Positive.';
  } else if (negativeWords.length > positiveWords.length) {
    return 'The sentiment of the text is Negative.';
  } else {
    return 'The sentiment of the text is Neutral.';
  }
}

function recordSentiments(sentiments, words, sentimentFlag = true) {
  let typeOfSentiment = sentimentFlag ? 'Positive' : 'Negative';
  sentiments.number = 'There are ' + words.length + ' ' + typeOfSentiment.toLowerCase()
    + ' words in the text.';
  sentiments.words = typeOfSentiment + ' sentiments: ' + words.join(', ');
}

function sentiment(str) {
  let results = {
    overallSentiment: '',
    positiveSentiments: {
      number: '',
      words: ''
    },
    negativeSentiments: {
      number: '',
      words: ''
    },
  };
  const positiveRegexStr = '(fortunes?)|(dream(s|t|ed)?)|(love(s|d)?)|(respect(s|ed)?)|' +
    '(patien(ce|t)?)|(devout(ly)?)|(nobler?)|(resolut(e|ion)?)';
  const negativeRegexStr = '(die(s|d)?)|(heartached?)|(death)|(despise(s|d)?)|(scorn(s|ed)?)|' +
    '(weary)|(troubles?)|(oppress(es|ed|or(\'s)?)?)';
  const positiveRegex = new RegExp(positiveRegexStr, 'gi');
  const negativeRegex = new RegExp(negativeRegexStr, 'gi');

  let wordList = str.toLowerCase().match(/[a-z']+/g);
  let positiveWords = wordList.filter((word) => positiveRegex.test(word) );
  let negativeWords = wordList.filter((word) => negativeRegex.test(word) );

  results.overallSentiment = getOverallSentiment(positiveWords, negativeWords);
  recordSentiments(results.positiveSentiments, positiveWords);
  recordSentiments(results.negativeSentiments, negativeWords, false);

  return results;
}

export { sentiment };