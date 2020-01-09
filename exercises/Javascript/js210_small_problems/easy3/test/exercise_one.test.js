import { teddy } from '../code/teddy';

describe('Exercises JS210 Small Problems Easy Three Exercise One', function () {
  it('shows Teddy\'s age which is limited to 20 to 200 inclusive', function () {
    var result = teddy();
    expect(result).toMatch(/Teddy is \d{2,3} years old!/);
  });
});