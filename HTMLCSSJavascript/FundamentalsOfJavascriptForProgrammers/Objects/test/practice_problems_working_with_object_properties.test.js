import { copyProperties, incrementProperty, objectHasProperty, wordCount } from '../code/object_properties.js';
describe('Practice Problems: Working With Object Properites', () => {
  var pets, wins, expected, hal;

  beforeEach(() => {
    pets = {
      cat: 'Simon',
      dog: 'Dwarf',
      mice: null,
    };
    wins = {
      steve: 3,
      susie: 4,
      elmer: 'foo',
    };
    hal = { model: 9000, enabled: true };
  });
  it('objectHasProperty returns true if property exists, regardless of value', () => {
    expected = [true, true];
    var expectAry = [];
    expectAry.push(objectHasProperty(pets, 'dog'));
    expectAry.push(objectHasProperty(pets, 'mice'));
    expect(expectAry).toEqual(expected);
  });

  it('objectHasProperty returns false if property does not exist', () => {
    expect(objectHasProperty(pets, 'lizard')).toBeFalsy();
  });

  it('incrementProperty returns the incremented value and mutates the object', () => {
    expected = { steve: 3, susie: 5, elmer: 'foo' };
    expect(incrementProperty(wins, 'susie')).toBe(5);
    expect(wins).toEqual(expected);
  });

  it('incrementProperty returns the value if it cannot be incremented', () => {
    expected = { steve: 3, susie: 4, elmer: 'foo' };
    expect(incrementProperty(wins, 'elmer')).toBe('foo');
    expect(wins).toEqual(expected);
  });

  it('incrementProperty retuns 1 and adds property if property does not exist', () => {
    expected = { steve: 3, susie: 4, elmer: 'foo', lucy: 1 };
    expect(incrementProperty(wins, 'lucy')).toBe(1);
    expect(wins).toEqual(expected);
  });

  it('copyProperties copies to an empty object', () => {
    var sal = {};
    expect(copyProperties(hal, sal)).toBe(2);
    expect(sal).toEqual(hal);
  });

  it('copyProperties copies to an object with existing properties', () => {
    var sal = { foo: "bar" };
    expected = { model: 9000, enabled: true, foo: "bar" };
    expect(copyProperties(hal, sal)).toBe(2);
    expect(sal).toEqual(expected);
  });

  it('wordCount converts a string to an object with a count for each word', () => {
    var str = 'box car cat bag box';
    expected = { box: 2, car: 1, cat: 1, bag: 1 };
    expect(wordCount(str)).toEqual(expected);
  });
});