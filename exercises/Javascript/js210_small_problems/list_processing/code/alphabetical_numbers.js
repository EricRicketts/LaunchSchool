function alphabeticNumberSort(numArr) {
  const NUM_TO_WORD = {
    0: 'zero', 1: 'one', 2: 'two', 3: 'three', 4: 'four', 5: 'five',
    6: 'six', 7: 'seven', 8: 'eight', 9: 'nine', 10: 'ten', 11: 'eleven',
    12: 'twelve', 13: 'thirteen', 14: 'fourteen', 15: 'fifteen',
    16: 'sixteen', 17: 'seventeen', 18: 'eighteen', 19: 'nineteen'
  };

  const WORD_TO_NUM = {
    'zero': 0, 'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 'six': 6,
    'seven': 7, 'eight': 8, 'nine': 9, 'ten': 10, 'eleven': 11, 'twelve': 12,
    'thirteen': 13, 'fourteen': 14, 'fifteen': 15, 'sixteen': 16, 'seventeen': 17,
    'eighteen': 18, 'nineteen': 19
  };

  let strNumArr = numArr.map(function(num) { return NUM_TO_WORD[num]; });

  return strNumArr.sort().map(function(word) { return WORD_TO_NUM[word]; });
}

function alphabeticNumberSortLaunchSchool(numArr) {
  return numArr.sort(wordSort);
}

function wordSort(num1, num2) {
  const NUMBER_WORDS = [
    'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
    'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen',
    'eighteen', 'nineteen'
  ];

  if (NUMBER_WORDS[num1] > NUMBER_WORDS[num2]) {
    return 1;
  } else if (NUMBER_WORDS[num1] < NUMBER_WORDS[num2]) {
    return -1;
  } else {
    return 0;
  }
}

export { alphabeticNumberSort, alphabeticNumberSortLaunchSchool };

/*
I wanted to include the Launch School solution because I considered it much better
than the one I came up with.  I have too many accessory constants, Launch School with
a clever use an a single array, really simplified the solution.
 */