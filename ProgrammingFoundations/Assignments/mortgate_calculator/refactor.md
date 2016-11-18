## Refactoring of mortgage_calculator.rb based on Pete Hanson's Code Review
1.  User Interface
    *  For the loan amount I removed the requirement for properly placed commas.
       Trying to optionally include commas and at the same time check for properly
       placed commas will have to wait for the Regex instruction
    *  I think you might have misread my test and/or code, I limited the interest
       rate to two digits to the left of the decimal (at least this was my intent).
       Though I did add a test case verifying three digits to the right of the decimal
       was an accpetible interest rate.  I did some research and triple digit interest
       rates and not typically offered they only occur as the result of predatory behavior
       on the part of the lender.


## Some Key Concepts From Pete Hanson's Code Review