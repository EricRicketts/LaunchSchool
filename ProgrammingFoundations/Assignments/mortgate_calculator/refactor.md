## Refactoring of mortgage_calculator.rb based on Pete Hanson's Code Review
1.  User Interface
    *  For the loan amount I removed the requirement for properly placed commas.
       Trying to optionally include commas and at the same time check for properly
       placed commas will have to wait for the Regex instruction
    *  I think you might have misread my test and/or code, I limited the interest
       rate to two digits to the left of the decimal (at least this was my intent).
       Though I did add a test case verifying three digits to the right of the decimal
       was an accpetible interest rate.  I did some research and triple digit interest
       rates are not typically offered and they tend to occur as the result of predatory
       behavior on the part of the lender.
    *  I updated the code to handle zero interest rates, however, I do not permit negative
       interest rates, though I do know they may happen ove time, it is far from standard
       practice right now.
    *  Thanks for the input on the month limiter, I switched to the user entering the
       number of years vice the number of months.  Again after looking at a number of
       loan calculation sites, it seems years is the standard default vice months.  There
       is no limit on the number of years for the loan, but it cannot be negative.
    *  The answer is now rounded to two digits after the decimal point.
    *  The use must now enter distince Y/y to continue the program or N/n to quit.  Though
       any for of _yes_ and _no_ are accepted.
2.  Source Code Notes and Issues
    *  Renamed ```#calc_payment``` to ```#calculate_payment```
    *  Renamed ```#conv_input_to_num``` to ```#convert_input_to_number```
    *  Replaced ```loan_amount``` default string with an empty string for the input to ```#convert_input_to_number```
    *  In ```#leave_program?``` method I removed the ternary statment with explicitly returned _true_ or _false_
    *  In ```#valid_interest_rate```, ```#valid_loan_amount```, and ```#valid_loan_duration``` renamed the ```regex```
       variable in each method to something more descriptive.


## Some Key Concepts From Pete Hanson's Code Review