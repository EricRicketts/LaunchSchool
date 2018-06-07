# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet: a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.


# p high('man i need a taxi up to ubud') == 'taxi'
# p high('what time are we climbing up the volcano') == 'volcano'
# p high('take me to semynak') == 'semynak'
# p high('aa b') == 'aa'



=begin
  - Hash which maps the letters to integers
  - create an array of words by splitting the string
  - initialize a hash to 0
  - iterate this array of words
    - take each word break down into chars
    - iterate that word into a number by using the hash to get a value for each letter and then sum the result
      - put the value of the digits and the word into the hash
  - then get the max string value by selection
  - once I do this, I return the first one
=end


# # check the value of first word, compare to max i it is greater that this is my max_word if it is not move to the next word

# p high('man i need a taxi up to ubud') == 'taxi'
# p high('what time are we climbing up the volcano') == 'volcano'
# p high('take me to semynak') == 'semynak'
# p high('aa b') == 'aa'


=begin
high('abcde') = 0
high('abcdeaa') = 1
high('abcdeaB') = 2
high('')
=end