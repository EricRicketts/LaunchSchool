import {firstObj, secondObj, TESgames, fixTESGames, secondFixTESGames, foo, secondFoo, thirdFoo,
  logReturnValue, logReturnValueSecond} from "../code/dealing_with_context_loss";

describe('JS225 Object Oriented Javascript Function Context and Objects', function () {
  describe('Practice Problems Set Four Dealing With Context Loss', function () {
    let expected, expectedArr;
    beforeEach(() => {
      expected = 'Christopher Turk is a Surgeon.';
      expectedArr = [
        'The Elder Scrolls Arena',
        'The Elder Scrolls Daggerfall',
        'The Elder Scrolls Morrowind',
        'The Elder Scrolls Oblivion',
        'The Elder Scrolls Skyrim'
      ];
    });
    it('implicit method execution context works as expected', function () {
      expect(firstObj.getDescription()).toBe(expected);
    });

    it('there is context loss when being invoked inside another function', function () {
      expect(() => { logReturnValue(firstObj.getDescription); }).toThrow(TypeError);
    });

    it('manually provide the execution context for the function', function () {
      expect(logReturnValueSecond(firstObj.getDescription, firstObj)).toBe(expected);
    });

    it('explicitly bind the returned function in the method to the owning object', function () {
      let getTurkDescription = firstObj.getDescription.bind(firstObj);
      expect(getTurkDescription()).toBe(expected);
      expect(logReturnValue(secondObj.getDescription())).toBe(expected);
    });

    it('forEach does not have access to method implicit context', function () {
      expect(() => { TESgames.listGames() }).toThrow(TypeError);
    });

    it('forEach allows for an explicit binding', function () {
      expect(fixTESGames.listGames()).toEqual(expectedArr);
    });

    it('another fix for TESgames, using local variables to capture execution context', function () {
      expect(secondFixTESGames.listGames()).toEqual(expectedArr);
    });

    it('functions inside of methods loose context with respect to the owning object', function () {
      global.a = 0;
      foo.incrementA();
      foo.incrementA();
      foo.incrementA();
      expect([foo.a, global.a]).toEqual([0, 3]);
    });

    it('hard binding fixes the execution context', function () {
      secondFoo.incrementA();
      secondFoo.incrementA();
      secondFoo.incrementA();
      expect(secondFoo.a).toBe(3);
    });

    it('use apply repeatedly to fix the execution context', function () {
      thirdFoo.incrementA();
      expect(thirdFoo.a).toBe(3);
    });
  });
});