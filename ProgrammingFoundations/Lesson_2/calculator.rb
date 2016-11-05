def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  regex = Regexp.new('^\s*\d+\.*\d*\s*$')
  regex.match(number)
end