class SecretHandshake
  REVERSE_POINT = 15
  BINARY_DIGITS = %w(0 1)
  CODES = %W[wink double\sblink close\syour\seyes jump]

  def initialize(n)
    @binary = convert_to_binary(n)
  end

  def commands
    binary.nil? ? [] : generate_commands
  end

  private

  attr_reader :binary

  def convert_to_binary(n)
    if n.is_a?(Integer)
      n.to_s(2)
    elsif n.chars.all? { |char| BINARY_DIGITS.include?(char) }
      n
    else
      nil
    end
  end

  def generate_commands
    secret_commands = binary.reverse.chars.map.with_index do |digit, idx|
      next unless digit == '1'
      CODES[idx]
    end.compact
    reverse_command_order? ? secret_commands.reverse : secret_commands
  end

  def reverse_command_order?
    binary.to_i(2) > REVERSE_POINT
  end
end
