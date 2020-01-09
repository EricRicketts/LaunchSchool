import  { one } from '../code/the_red_pill';

describe('Exercises Javascript Language Fundamentals Medium Two Exercise Seven', function () {
  it('returns both text and a function', function () {
    var redPill = one();
    var firstPart = redPill.first;
    var secondPart = redPill.second(32, 77, 97, 116, 114, 105, 120, 33);
    var result = firstPart + secondPart;
    expect(result).toBe('Welcome to the Matrix!');
  });
});
/*
An important point to note in this exercise is that in the second property of the
returned object we return the function anotherOne and we invoke it by the code
above => var secondPart = redPill.second(32, 77, 97, 116, 114, 105, 120, 33);
even though anotherOne is invoked in a different scope it still has access to
the log function because it creates a closure over that function.
 */