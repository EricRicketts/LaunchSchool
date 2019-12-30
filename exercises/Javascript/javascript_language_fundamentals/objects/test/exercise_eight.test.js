describe('Exercises: Javascript Language Fundamentals: Objects: Exercise Eight', () => {
  var penultimateError, penultimate, result, expected;

  beforeEach(() => {
    penultimateError = function(string) {
      return string.split(' ')[-2];
    }

    penultimate = function(string) {
      var wordArr = string.split(/\s+/);
      var nextToLast = wordArr.length - 2;
      return wordArr[nextToLast];
    }
  });

  it('cannot used negative index for index property', () => {
    result = [penultimateError('last word'), penultimateError('Launch School is great!')];
    expected = [undefined, undefined];
    expect(result).toEqual(expected);
  });

  it('must use positive indices in javascript array', () => {
    result = [penultimate('last word'), penultimate('Launch School is great!')];
    expected = ['last', 'is'];
    expect(result).toEqual(expected);
  });
});