describe('Exercises: Javascript Langauge Fundamentals: Medium One: Exercise Six', function () {
  var debugIt, expected;
  beforeEach(() => {
    debugIt = function() {
      var status = 'debugging';
      function logger() {
        return status;
      }

      var x = logger();
      return x;
    }
  });

  it('functions have access to local variables in a surrounding outer scope', function () {
    expect(debugIt()).toBe('debugging');
  });
});