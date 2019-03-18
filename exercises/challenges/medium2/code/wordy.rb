class WordProblem
  OPERATORS = {
    "plus" => :+,
    "minus" => :-,
    "divided" => :/,
    "multiplied" => :*
  }

  REGEX = Regexp.new(OPERATORS.keys.map { |op| /\b#{op}\b/ }.join("|"))

  def initialize(str)
    @str = str
  end

  def answer
    raise ArgumentError unless str.match?(REGEX)
    arr = str.scan(/-?[[:digit:]]+|#{REGEX}/)

    arr[1..-1].inject(arr.first.to_i) do |result, n_or_op|
      if n_or_op.match?(REGEX)
        lambda { |x| result.send(OPERATORS[n_or_op], x) }
      else
        result.call(n_or_op.to_i)
      end
    end
  end

  private

  attr_reader :str
end
