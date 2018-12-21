# require 'minitest/autorun'
# require 'minitest/pride'
require 'pry-byebug'

def compare(str, flag)
  puts "Before: #{str}"
  puts "After: #{yield(str, flag)}"
end

compare("foo", :upcase) do |str, flag|
  case flag
  when :upcase, :capitalize then str.send(flag)
  else str
  end
end

compare("foo", :capitalize) do |str, flag|
  case flag
  when :upcase, :capitalize then str.send(flag)
  else str
  end
end
