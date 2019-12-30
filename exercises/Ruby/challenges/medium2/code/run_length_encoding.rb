class RunLengthEncoding

  def self.encode(input)
    input.gsub(/(.)\1*/) { |s| (s.length if s.length > 1).to_s << s[0] }
  end

  def self.decode(input)
    input.gsub(/(\d*)(.)/) { $1.empty? ? $2 : $2 * $1.to_i }
  end
end

=begin

module RunLengthEncoding
  def self.encode(str)
    str.gsub(/(.)\1+/) { |match| "#{match.size}#{match[0]}" }
  end

  def self.decode(str)
    str.gsub(/(\d+)(.)/) { $2 * $1.to_i }
  end
end

similar to mine but cleaner.  First, the module was a better design
choice as a class makes more sense if it has instance methods.  Secondly,
he made use of the fact 
=end
