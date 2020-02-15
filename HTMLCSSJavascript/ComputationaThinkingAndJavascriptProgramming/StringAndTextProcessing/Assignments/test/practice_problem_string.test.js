describe('LS215 String And Text Processing Practice Problem String', function () {
  let firstName, lastName, fullName, language, expected;
  it('should concatenate using concat operator', function () {
     firstName = 'Eric';
     lastName = 'Ricketts';
     fullName = firstName + ' ' + lastName;
     expected = 'Eric Ricketts';

    expect(fullName).toBe(expected);
  });

  it('should concatenate using concat method', function () {
     firstName = 'Eric';
     lastName = 'Ricketts';
     expected = 'Eric Ricketts';

    expect(firstName.concat(' ', lastName)).toBe(expected);
  });

  it('should split the full name into an array of two words', function () {
     fullName = 'Eric Ricketts';
     expected = ['Eric', 'Ricketts'];

     expect(fullName.split(' ')).toEqual(expected);
  });

  it('should find the index of the first occurrence of a character', function () {
    language = 'JavaScript';

    expect(language.indexOf('S')).toBe(4);
  });

  it('should find the UTF-16 value of the \'S\' in JavaScript', function () {
    language = 'JavaScript';

    expect(language.charCodeAt(language.indexOf('S'))).toBe(83);
  });

  it('should return the capital S in JavaScript', function () {
    language = 'JavaScript';
    let charCode = language.charCodeAt(language.indexOf('S'));

    expect(String.fromCharCode(charCode)).toBe('S');
  });

  it('should return the last index of the letter a in Javascript', function () {
    language = 'JavaScript';

    expect(language.lastIndexOf('a')).toBe(3);
  });

  it('should compare strings', function () {
    let a = 'a';
    let b = 'b';
    let B = 'B';

    expect(a < b).toBe(true);
    expect(B < a).toBe(true);
  });

  it('should capture the location of letters a and v in Javascript', function () {
    language = 'JavaScript';
    let aIndex = language.indexOf('a');
    let vIndex = language.indexOf('v');

    expect(language.substring(aIndex, aIndex + 4)).toBe('avaS');
    expect(language.substring(vIndex, vIndex + 4)).toBe('vaSc');
  });

  it('should capture the location of letters a and v in Javascript in a different way', function () {
    language = 'JavaScript';
    let aIndex = language.indexOf('a');
    let vIndex = language.indexOf('v');

    expect(language.substring(aIndex, 4)).toBe('ava');
    expect(language.substring(vIndex, 4)).toBe('va');
  });

  it('should compose strings via concatenation', function () {
    let fact1 = 'Javascript is fun';
    let fact2 = 'Kids like it to';
  });
});