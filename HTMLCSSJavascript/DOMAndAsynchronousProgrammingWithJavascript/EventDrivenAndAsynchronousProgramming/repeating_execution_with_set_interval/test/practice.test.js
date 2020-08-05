describe('Launch School Repeating Execution With setInterval', function () {
  let results, expected, startCounting, stopCounting, t;
  beforeEach(() => {
    jest.useFakeTimers();
    startCounting = function(n, results) {
      t = setInterval(() => {
        n += 1;
        results.push(n);
      }, 1000);
    }
    stopCounting = function(id) {
      clearInterval(id);
    }
  });

  it('should advance the count by one every second', function () {
    results = [];
    expected = [1, 2, 3, 4, 5];

    startCounting(0, results);
    jest.advanceTimersByTime(5000);
    stopCounting(t);
    jest.advanceTimersByTime(10000);
    expect(results).toEqual(expected);
  });
});