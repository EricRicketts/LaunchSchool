
const POSITIVE_WORDS = ['fortune', 'dream', 'love', 'respect',
  'patience', 'devout', 'noble', 'resolution'];
const NEGATIVE_WORDS = ['die', 'heartache', 'death', 'despise',
  'scorn', 'weary', 'trouble', 'oppress'];

function collectPositiveAndNegativeWords(words, positiveWords, negativeWords) {
  words.forEach(function(word) {
    if (POSITIVE_WORDS.includes(word)) {
      positiveWords.push(word);
    } else if (NEGATIVE_WORDS.includes(word)) {
      negativeWords.push(word);
    }
  });
    return [positiveWords, negativeWords];
}

function getNegativeSentiment(negativeSentiments, negativeWords) {
  negativeSentiments.number = 'There are ' +  negativeWords.length + ' negative words in the text.';
  negativeSentiments.words = 'Negative sentiments: ' + negativeWords.join(', ');
}

function getOverallSentiment(positiveWords, negativeWords) {
  if (positiveWords.length > negativeWords.length) {
    return 'The sentiment of the text is Positive.';
  } else if (negativeWords.length > positiveWords.length) {
    return 'The sentiment of the text is Negative.';
  } else {
    return 'The sentiment of the text is Neutral.';
  }
}

function getPositiveSentiment(positiveSentiments, positiveWords) {
  positiveSentiments.number = 'There are ' +  positiveWords.length + ' positive words in the text.';
  positiveSentiments.words = 'Positive sentiments: ' + positiveWords.join(', ');
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

  let words = str.split(/[\s.,]+/);
  let [positiveWords, negativeWords] = collectPositiveAndNegativeWords(words, [], []);
  results.overallSentiment = getOverallSentiment(positiveWords, negativeWords);
  getPositiveSentiment(results.positiveSentiments, positiveWords);
  getNegativeSentiment(results.negativeSentiments, negativeWords);

  return results;
}

function sentimentLaunchSchool(str) {
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

  let wordList = str.toLowerCase().match(/[a-z']+/g);
  let positiveWords = wordList.filter((word) => POSITIVE_WORDS.includes(word) );
  let negativeWords = wordList.filter((word) => NEGATIVE_WORDS.includes(word) );

  results.overallSentiment = getOverallSentiment(positiveWords, negativeWords);
  getPositiveSentiment(results.positiveSentiments, positiveWords);
  getNegativeSentiment(results.negativeSentiments, negativeWords);

  return results;
}

export { sentiment, sentimentLaunchSchool };