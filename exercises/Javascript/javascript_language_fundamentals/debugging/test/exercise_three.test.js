import { placeABet, placeABetFixed } from "../code/place_a_bet";

describe('Exercises JS210 Javascript Language Fundamentals Debugging Exercise Three', function () {
  it('incorrect function declaration', function () {
    expect(() => {
      placeABet(10);
    }).toThrow(ReferenceError);
  });

  it('fixed code makes use of a proper function declaration', function () {
    var phrases = ["Congratulations, you win!", "Wrong-o! You lose."];
    expect(phrases).toContain(placeABetFixed(10));
  });
});