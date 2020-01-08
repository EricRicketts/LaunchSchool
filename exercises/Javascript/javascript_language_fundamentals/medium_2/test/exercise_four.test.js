import { doubler, makeDoubler } from "../code/caller";

describe('Exercises Javascript Language Fundamentals Medium Two Exercise Four', function () {
  var expected;

  it('function doubler returns the caller and a doubled value', function () {
    expect(doubler(5, 'Victor')).toEqual([10, 'Victor']);
  });

  it('valid to return a function', function () {
    var doubler = makeDoubler('Victor');
    expect(doubler(5)).toEqual([10, 'Victor']);
  });
});
/*
this exercise illustrates that in Javascript functions are 'first class citizens'.  One implication of
this is that functions can be valid return values from a function.  Note makeDoubler has a closure over
the passed in caller parameter.
 */