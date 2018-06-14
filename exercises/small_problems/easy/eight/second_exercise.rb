=begin
Madlibs

Mad libs are a simple game where you create a story template with blanks for words.
You, or another player, then construct a list of words and place them into the story,
creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an
adjective and injects those into a story that you create.

Example

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!


=end

def madlib
  hsh = {}
  ary = [:noun, :verb, :adjective, :adverb]
  ary.each do |part_of_speech|
    puts "Enter a #{part_of_speech.to_s}:"
    hsh[part_of_speech] = gets.chomp
  end
  str = "Do you #{hsh[:verb]} you #{hsh[:adjective]} #{hsh[:noun]} #{hsh[:adverb]}?  That's hilarious!"
  puts str
end

madlib
