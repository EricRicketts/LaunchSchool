describe('JS210: Javascript Language Fundamentals: Medium 1: Exercise Five', function () {
  var expected, str;
  it('variables assigned to functions can be reassigned to another value', function () {
    /*
    in this case the function declaration counter is hoisted first before the variable declaration, so
    a variable is created with the name counter and assigned the function definition as a value.  However,
    in line 9, the variable counter is reassigned a numeric value of 5.
     */
    var counter = 5;
    var rate = 3;
    str = 'The total value is ' + String(counter * rate);
    expected = 'The total value is 15';
    function counter(count) {
      return count;
    }
    expect(str).toBe(expected);
  });

  it('variables are evaluated in light of their most recent assignment', function () {
    /*
    In this case the function declaration occurs first and the variable counter is assigned the function
    definition, however, in line 28 the function reference is invoked not the function itself, so the *
    operator first converts the function to a numeric value, which is NaN.
     */
    function counter(count) {
      return count;
    }
    str = 'The total value is ' + String(counter * rate);
    expected = 'The total value is NaN';
    expect(str).toBe(expected);
    var counter = 5;
    var rate = 3;
  });

  it('variable can be overwritten at any time', function () {
    /*
    function counter is hoisted so counter is initially assigned a function definition as a value but
    then in line 41 counter is reassigned to a numeric value of 5.
     */
    expected = 'The total value is 15';
    var counter = 5;
    var rate = 3;
    function counter(count) {
      return count + 1;
    }
    str = 'The total value is ' + String(counter * rate);
    expect(str).toBe(expected);
  });
});