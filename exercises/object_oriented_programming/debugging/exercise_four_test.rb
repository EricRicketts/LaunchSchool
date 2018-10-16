require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFourTest < Minitest::Test
  class EmployeeManagementSystem
    attr_reader :employer

    def initialize(employer)
      @employer = employer
      @employees = []
    end

    def add(employee)
      if exists?(employee)
        "Employee serial number is already in the system."
      else
        employees.push(employee)
        "Employee added."
      end
    end

    alias_method :<<, :add

    def remove(employee)
      if !exists?(employee)
        "Employee serial number is not in the system."
      else
        employees.delete(employee)
        "Employee deleted."
      end
    end

    def exists?(employee)
      employees.any? { |e| e == employee }
    end

    def display_all_employees
      employee_str = employees.inject([]) do |str, employee|
        str << employee.to_s
      end.join("\n")
      "#{employer} Employees:\n\n".concat(employee_str)
    end

    private

    attr_accessor :employees
  end

  class EmployeeNoFix
    attr_reader :name

    def initialize(name, serial_number)
      @name = name
      @serial_number = serial_number
    end

    def ==(other)
      serial_number == other.serial_number
    end

    def to_s
      "Name: #{name}\n" +
      "Serial No: #{abbreviated_serial_number}"
    end

    private

    attr_reader :serial_number

    def abbreviated_serial_number
      serial_number[-4..-1]
    end
  end

  class Employee
    attr_reader :name

    def initialize(name, serial_number)
      @name = name
      @serial_number = serial_number
    end

    def ==(other)
      serial_number == other.serial_number
    end

    def to_s
      "Name: #{name}\n" +
      "Serial No: #{abbreviated_serial_number}\n"
    end

    protected

    attr_reader :serial_number

    private

    def abbreviated_serial_number
      serial_number[-4..-1]
    end
  end

  def test_one
    miller_contracting = EmployeeManagementSystem.new('Miller Contracting')

    becca = EmployeeNoFix.new('Becca', '232-4437-1932')
    raul = EmployeeNoFix.new('Raul', '399-1007-4242')
    natasha = EmployeeNoFix.new('Natasha', '399-1007-4242')
    miller_contracting << becca

    assert_raises(NoMethodError) { miller_contracting << raul }
  end

  def test_two
    expected = <<-EXPECTED
Miller Contracting Employees:

Name: Becca
Serial No: 1932

Name: Natasha
Serial No: 4242
EXPECTED
    miller_contracting = EmployeeManagementSystem.new('Miller Contracting')
    becca = Employee.new('Becca', '232-4437-1932')
    raul = Employee.new('Raul', '399-1007-4242')
    natasha = Employee.new('Natasha', '399-1007-4242')

    miller_contracting << becca     # => Employee added.
    miller_contracting << raul      # => Employee added.
    miller_contracting << raul      # => Employee serial number is already in the system.
    miller_contracting << natasha   # => Employee serial number is already in the system.
    miller_contracting.remove(raul) # => Employee deleted.
    miller_contracting.add(natasha) # => Employee added.

    # binding.pry
    assert_output(expected) { puts miller_contracting.display_all_employees }
  end
end