class Robot
  LETTERS = ('A'..'Z').entries
  NUMBERS = (0..999).entries

  @@used_names = []

  def initialize
    @name = gen_name
  end

  def name
    @name.empty? ? gen_name : @name
  end

  def reset
    @name = ''
  end

  private

  def gen_name
    begin
      new_name = sample_letters + sample_numbers
    end while @@used_names.include?(new_name)
    @@used_names << new_name
    new_name
  end

  def sample_letters
    LETTERS.sample + LETTERS.sample
  end

  def sample_numbers
    number = NUMBERS.sample
    case number
    when 0..9 then '00'
    when 10..99 then '0'
    else ''
    end << number.to_s
  end
end

=begin
Excellent solution

class Robot
  attr_accessor :name
  @@names = []
  def initialize
    reset
  end

  def reset
    @@names.delete(name)
    while @@names.include?(self.name = sample_name); end
    @@names << name
  end

  def sample_name
    ('AA'..'ZZ').to_a.sample + ('000'..'999').to_a.sample
  end
end
=end