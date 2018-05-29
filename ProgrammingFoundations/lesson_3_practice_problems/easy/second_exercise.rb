### Question 1 ###

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# see if "Spot" is present.

# Bonus: What are two other hash methods that would work just as well for this solution?

ages.has_key?("Spot")

ages.include?("Spot")
ages.member?("Spot")

# exactly what LS provided though you can also use ages.key?("Spot")


### Question 2 ###

# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original munsters_description above):

# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description.capitalize
munsters_description.swapcase
munsters_description.downcase
munsters_description.upcase

# same solutions as LS but all methods above in their solutions were "!" methods


### Question 3 ###

# We have most of the Munster family in our age hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge(additional_ages) # LS solution used Hash#merge!


### Question 4 ###

# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?('Dino')

# LS solution advice.match('Dino'), I do not like the question and answer
# for a couple of reassons.  First, the way the question was worded, it
# seems as if a Boolean condition was being asked for.  Secondly, String#match
# returns a MatchData object, so it is not a Boolean return.  To me, another
# more appropriate solution would be advice.match?('Dino').  I think what both
# String#match and String#match? do is attempt to covnert the string into a regexp
# if a regexp is not provided.


### Question 5 ###

# Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# either of the following would do:

flintstones = %W(Fred Barny Wilma Betty BamBam Pebbles)
flintstones = %w(Fred Barny Wilma Betty BamBam Pebbles) # LS solution


### Question 6 ###

# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintsones << "Dino" # LS solution
flintstones.push("Dino")
flintstones.apped("Dino")
flintstones.insert(-1, "Dino")


### Question 7 ###

# In the previous practice problem we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# We could have used either Array#concat or Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)

flintstones << "Dino" << "Hoppy"
flintsones.push("Dino", "Hoppy") # LS solution
flintsones.append("Dino", "Hoppy")
flintstones.concat(["Dino", "Hoppy"]) # LS solution


### Question 8 ###

# Shorten this sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

starting_index = advice.index("house")
advice.slice!(starting_index..-1)
advice.slice!(0, advice.index("house")) # LS solution, which is correct
# Mine is incorrect, I do the opposite I return "house training your pet dinosaur"
# but lead the advice variable as "Few things are important as "
new_advice = advice.slice(0...advice.index("house")) # this solution is correct
# as long as one wants to return "Few things in life are as important as "

# ...remove everything starting from "house".

# Review the String#slice! documentation, and use that method to make the return value
# "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?


### Question 9 ###

# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

statement.count('t')


### Question 10 ###

# Back in the stone age (before CSS) we used spaces to align things on the screen.
# If we had a 40 character wide table of Flintstone family members, how could we
# easily center that title above the table with spaces?

title = "Flintstone Family Members"
title.center(40)













