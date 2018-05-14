ary = []
arr = []
count = 0

loop do
  count += 1
  ary.push(count)
  break puts "I am done counting to 10" if count >= 10
end


p ary.inspect
p arr.inspect