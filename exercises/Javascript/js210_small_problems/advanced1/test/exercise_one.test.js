import { madLibs, templateOne, templateTwo } from "../code/madlibs";

describe('JS210 Small Problems Advanced One Exercise One', function () {
  let expected, regexNoun, regexVerb, regexAdjective, regexAdverb;
  beforeEach(() => {
    regexNoun = /fox|dog|head|leg|tail|cat/;
    regexVerb = /jumps|lifts|bites|licks|pats/;
    regexAdjective = /quick|lazy|sleepy|noisy|hungry/;
    regexAdverb = /easily|lazily|noisily|excitedly/;
  });

  it('should render template one noun verb adjective noun', function () {
    expected = new RegExp(String.raw`The ${regexNoun} ${regexVerb} a ${regexAdjective} ${regexNoun}\.`);
    expect(madLibs(templateOne)).toMatch(expected);
  });

  it('should should render template two adjective noun verb adverb', function () {
    expected = new RegExp(String.raw`The ${regexAdjective} ${regexNoun} ${regexVerb} ${regexAdverb}\.`);
    expect(madLibs(templateTwo)).toMatch(expected);
  });
});