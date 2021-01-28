describe('setTimeout exercises', function() {
  let delayLog, results, expected;
  beforeEach(() => {
    jest.useFakeTimers();
  });
  afterEach(() => {
    jest.clearAllTimers();
    jest.clearAllMocks();
  });

  it('should push integers onto the array every second', function () {
    let logOfDelay = [];
    let mockCallback = jest.fn(function(i, arr) {
      arr.push(i);
    });
    let delayLog = function(arr, callback) {
      for( let i = 1; i < 11; i += 1) {
        setTimeout(() => {
          callback(i, arr);
        }, i*1000);
      }
    }
    delayLog(logOfDelay, mockCallback);
    expect(setTimeout).toHaveBeenCalledTimes(10);
    /*
    this series of expectations is very important to understand.  Jest actually mimics the Javascript runtime
    environment.  So, I call delayLog and it runs to for loop calling setTimeout each time, so upon execution
    of the for loop, setTimeout does get called 10 times.  However, the execution of the callback for setTimeout
    only occurs after the specified delay, as each of these callbacks to put on the callback queue.  So to
    examine the results of the callback functions I need to advance the timers.  If I call jest.runAllTimers()
    it will run all of the timers to completion.  So my strategy here is to advance the timers here by some
    time and examine what the inputs are, thus verifying the results.
    */
    jest.advanceTimersByTime(1000);
    expect(mockCallback.mock.calls[0][0]).toBe(1);
    expect(mockCallback.mock.calls[0][1]).toEqual([1]);
    jest.advanceTimersByTime(1000);
    expect(mockCallback.mock.calls[1][0]).toBe(2);
    expect(mockCallback.mock.calls[1][1]).toEqual([1, 2]);
  });

  it('should execute callbacks based in the time given', function () {
    let results = [];
    expected = ['Once', 'a', 'upon', 'time'];
    setTimeout(() => {
      results.push('Once');
    }, 1000);
    setTimeout(() => {
      results.push('upon');
    }, 3000);
    setTimeout(() => {
      results.push('a');
    }, 2000);
    setTimeout(() => {
      results.push('time');
    }, 4000);
    jest.runAllTimers();
    expect(results).toEqual(expected);
  });

  it('should allow for nested setTimeout functions', function () {
    expected = [1, 2, 3, 4, 5, 6, 7];
    results = [];
    let g = () => results.push(1);
    let f = () => results.push(2);
    let d = () => results.push(3);
    let z = () => results.push(4);
    let n = () => results.push(5);
    let q = () => results.push(6);
    let s = () => results.push(7);
    setTimeout(() => {
      setTimeout(() => {
        q();
      }, 15000);

      d();

      setTimeout(() => {
        n();
      }, 5000);

      z();
    }, 10000);

    setTimeout(() => {
      s();
    }, 20000);

    setTimeout(() => {
      f();
    });

    g();

    jest.runAllTimers();
    expect(results).toEqual(expected);
  });

  it('should invoke the function after n seconds', function () {
    let results = [];
    let afterNSeconds = function(callback, n) {
      setTimeout(() => {
        callback(n);
      }, n*1000);
    }
    let mockCallback = jest.fn(function(n) {
      results.push(n);
    });
    afterNSeconds(mockCallback, 3);
    jest.runAllTimers();
    expect(mockCallback.mock.calls[0][0]).toBe(3);
    expect(results).toEqual([3]);
  });
});