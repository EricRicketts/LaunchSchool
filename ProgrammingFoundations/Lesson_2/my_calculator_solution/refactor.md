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