describe('LS215 Combining Abstractions', function () {
  let names, findFirstLetter, countLetters, count;
  beforeEach(() => {
    names = ['Heather', 'Gisella', 'Katsuki', 'Hua', 'Katy', 'Kathleen', 'Otakar'];
    findFirstLetter = function(word) {
      return word[0];
    };
    countLetters = function(total, letter) {
      total[letter] = total[letter] || 0;
      total[letter] += 1;
      return total;
    };
  });

  it('finds first letter with most occurrences', function () {
    count = names.map(findFirstLetter).reduce(countLetters, {});
    let mostFrequentLetter = Object.keys(count).reduce(function(highestLetterCount, currentLetter) {
      highestLetterCount = count[highestLetterCount] >= count[currentLetter] ? highestLetterCount : currentLetter;
      return highestLetterCount;
    });
    expect(mostFrequentLetter).toBe('K');
  });
});