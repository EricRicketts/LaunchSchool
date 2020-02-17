import { myName } from "../code/practice_problem_string";

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
    let compoundSentence = fact1.concat(' and ', fact2.toLowerCase(), '.');

    expect(compoundSentence).toBe('Javascript is fun and kids like it to.');
  });

  it('should use the bracket operator to get specific letters', function () {
    let fact1 = 'Javascript is fun';
    let fact2 = 'Kids like it to';

    expect(fact1[0]).toBe('J');
    expect(fact2[0]).toBe('K');
  });

  it('should return the last location of characters in a string with lastIndexOf', function () {
    let pi = (22/7).toString(10);

    expect(pi.lastIndexOf('14')).toBe(14);
  });

  it('should convert a number to a string with toString', function () {
     let boxNumber = (356).toString(10);
     // 356.toString(10) raises an error because Javascript interprets the '.' after the number
    // as a decimal and separator for a method call
     expect(boxNumber).toBe('356');
  });

  it('should convert a number to a string with two .. and then toString', function () {
    let boxNumber = 356..toString(10);
    expect(boxNumber).toBe('356');
  });

  it('should convert back and forth between strings and numbers', function () {
    let boxNumber = (356).toString(10);
    expect(Number.parseInt(boxNumber, 10)).toBe(356);
    expect(typeof Number.parseInt(boxNumber, 10)).toBe('number');
  });

  it('should convert a number to a string with String()', function () {
    let boxNumber = Number.parseInt((356).toString(10), 10);
    expect(String(boxNumber)).toBe('356');
    expect(typeof String(boxNumber)).toBe('string');
  });

  it('should use endsWith to determine output string', function () {
    let responseOne = myName('Bob');
    let responseTwo = myName('Bob!');

    expect(responseOne).toBe('Hello Bob.');
    expect(responseTwo).toBe('HELLO BOB.  WHY ARE WE SCREAMING?');
  });
});