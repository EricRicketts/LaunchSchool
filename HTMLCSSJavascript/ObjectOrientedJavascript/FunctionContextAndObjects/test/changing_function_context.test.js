QUnit.test('Changing Function Context', function (assert) {
  let temperatures = [53, 86, 12, 43];
  function average() {
    return this.reduce((sum, temp) => sum + temp, 0) / this.length;
  }

  assert.throws(function() { average(temperatures); }, TypeError, 'cannot call reduce on an object');
  // bind function to an array
  let averageTemperature = average.call(temperatures);
  assert.strictEqual(averageTemperature, 48.5, 'call average on temperature array, returns result of function call');
  let avgTemp = average.bind(temperatures);
  assert.strictEqual(avgTemp(), 48.5, 'bind returns a function, not the result of calling the function');
  temperatures.average = avgTemp;
  assert.ok(temperatures.average(), 48.5, 'temperature array now has an average method');
});