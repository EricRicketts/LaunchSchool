class RunLengthEncoding

  def self.encode(input)
    input.gsub(/(.)\1*/) { |s| (s.length if s.length > 1).to_s << s[0] }
  end

  def self.decode(input)
    input.gsub(/(\d*)(.)/) { $1.empty? ? $2 : $2 * $1.to_i }
  end
end
