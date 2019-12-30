## Coding Tips Section
1.  General
    *  Avoid __side effects__ when writing methods, __side effects__ often occur with things like writing to a file or
       mutating a non-local variable.  Where possible have the method take input and then return something.  If you
       are going to have a method purposefully do side effects make sure that is all the method does.
    *  Make sure your methods, when grouped together are at the same level of abstraction.
    *  When displaying output prepend the method name which reveals this, such as ```#print_welcome``` or ```#say_welcome```
    *  Use method arguments to complete your nameing convention.  Taking an example from the section a good method name
       would be ```#find_ace``` because it would be called as such: ```#find_ace(cards)```.  A poor method name would be
       ```#find_ace_from_cards``` because it would be called as such: ```#find_ace_from_cards(cards)```.
    *  Favor a ```loop do``` over a ```while``` loop when the ```while``` loop would force initialization outside the loop:

```ruby
answer = ''
while answer.downcase != 'n' do
  puts "Continue? (y/n)"
  answer = gets.chomp
end

# preferred

loop do
  puts "Continue? (y/n)"
  answer = gets.chomp
  break if answer.downcase == 'n'
end
```

2.  Truthiness
    *  Remember in ruby everything in true except ```nil``` and ```false```
    *  This is why we prefer ```if user_input``` over ```if user_input == true```
3.  Understand the Learning Process
    *  Rarely does one get to mastery the first time around.
    *  Learning the languages will be a cyclical process in that you will visit the concepts over and over
       before mastery is obtained.  But hopefully on each successive visit of a given concept understanding
       becomes easier than the previous time.