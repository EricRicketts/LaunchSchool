describe('Exercises Javascript Language Fundamentals Medium Two Exercise Three', function () {
  it('declarations are hoisted assignments occur in line', function () {
    var startingBalance = 1;
    var chicken = 5;
    var chickenQuantity = 7;

    var totalPayable = function(item, quantity) {
      return startingBalance + (item * quantity);
    }

    startingBalance = 5;
    expect(totalPayable(chicken, chickenQuantity)).toBe(40);

    startingBalance = 10;
    expect(totalPayable(chicken, chickenQuantity)).toBe(45);
  });
});
/*
in line 7 we have a function assignment so the function is assigned to
the variable totalPayable but is not invoked.  In line 11 we reassign
the startingBalance variable so the initial value of 1 is overwritten
by the value of 5 and this occurs again in line 14 where the value of 5
is overwritten by the value of 10.  Also note that the function assigned
to the variable totalPayable creates a closure around the startingBalance
variable, as functions have access to variables in a surrounding outer
scope.  So even though totalPayable is called after its assignment it
still has access to the changes in the startingBalance variable.

The Launch School discussion also made a good point.  totalPayable is
not a pure function, as it does not produce the same output for the same
inputs.  This happens because of a dependency on the enclosed startingBalance
variable.
 */