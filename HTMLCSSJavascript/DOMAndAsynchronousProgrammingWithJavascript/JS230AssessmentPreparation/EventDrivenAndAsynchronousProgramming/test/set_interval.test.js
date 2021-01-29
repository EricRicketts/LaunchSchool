describe('setInterval exercises', function() {
  let expected, results, count, startCounting, stopCounting, startCountingWithStop;
  beforeEach(() => {
    count = 0;
    startCounting = function() {
      setInterval(() => {
        count += 1;
      }, 1000);
    }
    stopCounting = function (id) {
      clearInterval(id);
    }
    startCountingWithStop = function(n) {
      let id = setInterval(() => {
        count += 1;
        if (count === n) { stopCounting(id); }
      }, 1000);
    }
    jest.useFakeTimers();
  });
  afterEach(() => {
    jest.clearAllMocks();
    jest.clearAllTimers();
  });

  it('should increment the counter every second', function () {
    startCounting();
    jest.advanceTimersByTime(3000);
    expect(count).toBe(3);
  });

  it('should increment for five seconds then stop using clearInterval', function () {
    startCountingWithStop(6);
    jest.advanceTimersByTime(7000);
    expect(count).toBe(6);
  });
});