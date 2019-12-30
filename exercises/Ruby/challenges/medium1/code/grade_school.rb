class School
  attr_accessor :school

  def initialize()
    @school = Hash.new { |h, k| h[k] = Array.new }
  end

  def add(name, grade)
    school[grade].push(name)
  end

  def grade(grade_number)
    school[grade_number].sort
  end

  def to_h
    school.map do |grade, students|
      [grade, students.sort]
    end.sort_by { |grade, students| [grade, students]}.to_h
  end
end