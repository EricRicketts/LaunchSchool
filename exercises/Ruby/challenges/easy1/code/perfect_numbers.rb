class PerfectNumber

  def self.classify(number)
    raise RuntimeError if number < 1
    sum = (1...number).select { |n| (number % n).zero? }.sum

    case sum
    when number then 'perfect'
    when (number+1...Float::INFINITY) then 'abundant'
    else 'deficient'
    end
  end
end