describe('Exercises: Javascript Language Fundamentals: Medium Two: Exercise Two', function () {
  var person, otherPerson;

  beforeEach(() => {
    person = { name: 'Victor' };
    otherPerson = { name: 'Victor' };
  });

  it('objects compare by reference not by value', function () {
    expect(person === otherPerson).toBeFalsy();
  });

  it('objects need to be explicitly compared by property', function () {
    expect(person.name === otherPerson.name).toBeTruthy();
  });

  it('Launch School solution, object identity ensures equality', function () {
    otherPerson = person;
    expect(person === otherPerson).toBeTruthy();
  });
});
/*
I misunderstood what Launch School wanted in this exercise.  I should have read the problem
more carefully, it said to refactor the code so that it works as expected, ie, works by
comparing via object identity.  So this can only occur when the two objects point to the
same location in memory.
 */