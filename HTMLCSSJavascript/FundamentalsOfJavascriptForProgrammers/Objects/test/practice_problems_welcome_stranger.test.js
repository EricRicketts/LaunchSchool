import { greetings } from '../code/greetings.js';

describe('JS210: Fundamentals of Javascript: Objects: Practice Problems: Welcome Stranger', () => {
  var arr, obj, result, expected;

  it('should handle three part name', () => {
    expected = 'Hello, John Q Doe!  Nice to have a Master Plumber around.';
    arr = ['John', 'Q', 'Doe'];
    obj = { title: 'Master', occupation: 'Plumber', };
    expect(greetings(arr, obj)).toBe(expected);
  });

  it('should handle two part name', () => {
    expected = 'Hello, John Doe!  Nice to have a Master Carpenter around.'
    arr = ['John', 'Doe'];
    obj = { title: 'Master', occupation: 'Carpenter' };
    expect(greetings(arr, obj)).toBe(expected);
  });
});