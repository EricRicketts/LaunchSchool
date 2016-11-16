### Refactoring of calculator.rb Based on Pete Hanson's Code Review

1.  Program Operation
    *  Program now handles both '+' and '-' signs in front of a number, the signs are optional
2.  User Interface
    *  User must now explicitly enter (Y/y) to continue or (N/n) to quit
    *  User cannot have a name consisting only of spaces
3.  Source Code Notes and Issues
    *  Eliminated the ```constants.rb``` file
    *  Eliminated heirarchy in the ```config.yml``` file, the ```OneLineMessages``` and ```MultiLineMessages``` keys are gone
    *  Removed ```#remove_white_space```
    *  Removed ```#read_in_numbers```
    *  Divide by zero check was pulled out of ```#compute_result``` and put in the main loop


### Some Key Concepts From Pete Hanson's Code Review

1.  Avoid Too Much Indirection
    *  In an effort to keep the methods short, I ended up defining too many methods
    *  If the statement is intention revealing enough and short, just use it vice wrapping it in a method call
2.  Make Sure the statements within a method support the idea behind the method name
    *  I had the reread operation of the second number with the divide operation called in ```#compute_result```
    *  Pete noted such an operation did not make sense within the scope of ```#compute_result```
    *  Such a check should be in another method in the main loop