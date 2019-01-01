# require 'minitest/autorun'
# require 'minitest/pride'

# rvm install ruby-2.2.0
# rvm use 2.2.0
# Gemfile contents see Gemfile
# run bundle install
# will produce a Gemfile.lock file
=begin
Line 12: variable assignment to the local variable foo by calling
the increment method with argument 5 and an accompanying block

Line 5: argument 4 is assigned to the local variable number

Line 6: conditional if Kernel#block_given? is truthy then Line 7
is executed

Line 7: in this case Kernel#block_given? is truthy so the local
variable number is incremented by 1 and passed to the accompanying
block as a block argument

Line 12: the block parameter num recieves the value from the
yield statement and is set to 6.

Line 13: the num block local variable is output and the puts
method returns nil

Line 14: block execution ends the return value for the block is nil
as this is the return value for the last statement executed in the block

Line 9: within #increment the block has finished executing so the
last line of the method is executed where the local variable num is
incremented by 1 and returned from the method.

Line 5: the local variable foo is assigned the return value
from the method which is 6

Line 16: the value of the local variable foo is output to the terminal
and nil is returned.

Line 12 -> Line 5 -> Line 6 -> Line 7 -> Line 12 -> Line 13 -> Line 14 -> Line 9 -> Line 5 -> Line 16


=end
