## Coding Tips

### Side Effects
1.  Limit the presence of *side effects* in your methods.
2.  Typically they take the form of displaying something or mutating an object.
3.  Understand if a method returns a value, has side effects, or both
4.  In general if a method has both side effects and a meaningful return value, it's a red flag.

```ruby
# side effect: displays something to the output
# returns: nil

def total(num1, num2)
  puts num1 + num2
end

# side effect: mutates the passed-in array
# returns: updated array

def append(target_array, value_to_append)
  target_array << value_to_append
end

# side effect: none
# returns: new integer

def total(num1, num2)
  num1 + num2
end
```

### Method Naming
1.  Name methods appropriately, this can really help one focus on the premise that methods should be
    limited to doing one thing.  For instance if the method outputs something, prepend it with ```print```
    or ```display```.
2.  A well designed and named method should be a *black box* and you should not have to look at the implementation
    to understand what it is doing.

### Mutating Collections
1.  It is fine to change the elements in a collection while iterating over them.
2.  But it is bad practice to change the collection itself while mutating over it, for example do not
    delete elements out of an array while iterating over it.

### Variable Shadowing
1.  Remember, particularly when using blocks that the block variable name takes precedence over local variables
    outside the block scope.

```ruby
name = 'johnson'

['kim', 'joe', 'sam'].each do |name|
  # uh-oh, we cannot access the outer scoped "name"!
  puts "#{name} #{name}"
end

# example below has no variable shadowing
# at the of the iteration name is assigned 'sam'
name = 'johnson'

['kim', 'joe', 'sam'].each do |fname|
  name = fname
end
```

### Do not Use Assignment in a Conditional
1.  This can lead to nasty bugs, but if the assignment is successful the result will always be true
2.  Do the assignment before the conditional, it leads to more readable code

```ruby
# bad

if some_variable = get_a_value_from_somewhere
  puts some_variable
end

# good

some_variable = get_a_value_from_somewhere
if some_variable
  puts some_variable
end
```
### Identifying Unused Parameters
1.  Use an underscore *_* for parameters that you will not use or do not care about

```ruby
# no intent to use the block variable
names = ['kim', 'joe', 'sam']
names.each { |_| puts "got a name!" }
```

