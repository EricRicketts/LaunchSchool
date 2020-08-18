let randomizer = require('../code/randomizer');

describe('Exercise One Randomizer', function () {
  let results, callback1, callback2, callback3, callback4, callback5;
  beforeEach(() => {
    callback1 = function() {
      return 'callback1';
    }
    callback2 = function() {
      return 'callback2';
    }
    callback3 = function() {
      return 'callback3';
    }
    callback4 = function() {
      return 'callback4';
    }
    callback5 = function() {
      return 'callback5';
    }
  });

  it('randomizer includes five callbacks and a count from one to ten in this case', done => {
    jest.useFakeTimers();
    let arr = [];
    randomizer(arr, callback1, callback2, callback3, callback4, callback5);
    jest.runAllTimers();
    done();
    results = arr.filter(str => /callback\d/.test(str));
    expect(arr.length).toBe(15);
    expect(results.length).toBe(5);
  });
});