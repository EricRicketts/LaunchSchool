class SecretHandshake

  def initialize(n)
    @binary = convert_to_binary(n)
  end


  private

  def convert_to_binary(n)
    n.to_s.match?(/[[:digit:]]+/) ? n.to_s(2)
  end
end