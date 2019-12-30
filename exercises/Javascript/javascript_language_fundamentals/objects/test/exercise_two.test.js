describe('Exercises: Javascript Langauge Fundamentals: Objects: Exercise Two', () => {
  var person, expected, result;

  beforeEach(() => {
    person = {
      firstName: function () { return 'Victor'; },
      lastName: function() { return 'Reyes'; },
    };
  });

  it('Methods must be called not referenced', () => {
    result = person.firstName + ' ' + person.lastName;
    expect(result).toMatch(/function firstName\(\)/);
  });

  it('Demonstrate properly calling methods', () => {
    expected = 'Victor Reyes';
    result = person.firstName() + ' ' + person.lastName();
    expect(result).toBe(expected);
  });
});