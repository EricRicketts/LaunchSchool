require 'byebug'

=begin
When Will I Retire?

Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

=end

def retirement_year
  puts "What is your age?"
  cur_age = gets.to_i
  puts "At what age would you like to retire?"
  retire_age = gets.to_i

  cur_year = Time.now.year
  work_years = retire_age - cur_age
  retire_year = cur_year + work_years

  puts "It's #{cur_year}.  You will retire in #{retire_year}."
  puts "You have only #{work_years} years of work to go!"
end

retirement_year