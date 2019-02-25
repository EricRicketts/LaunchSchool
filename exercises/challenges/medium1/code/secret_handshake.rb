class SecretHandshake

  def initialize(n)
    @binary = convert_to_binary(n)
  end


  private

  def convert_to_binary(n)
    case n
    when Integer
      n.to_s(2)
    when /[01]+/
      n
    else
      []
    end
  end
end

=begin
1.  Check if the input is an Integer, if so convert to binary
2.  Next check if the input is a string and if the string only
    consists of 1's and 0's if so process it, if not return
    an empty array
3.  take the binary numbers and reverse them
4.  cycle through each binary number with index
    index 0 digit 1 'wink'
    index 1 digit 1 'double blink'
    index 2 digit 1 'close your eyes'
    index 3 digit 1 'jump'
=end
