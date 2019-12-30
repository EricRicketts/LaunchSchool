require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

Alyssa has been assigned a task of modifying a class that was initially created
to keep track of secret information. The new requirement calls for adding logging,
when clients of the class attempt to access the secret data. Here is the class in
its current form:

class SecretFile
  attr_reader :data

  def initialize(secret_data)
    @data = secret_data
  end
end

She needs to modify it so that any access to data must result in a log entry being
generated. That is, any call to the class which will result in data being returned
must first call a logging class. The logging class has been supplied to Alyssa and
looks like the following:

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end

Hint: Assume that you can modify the initialize method in SecretFile to have an instance
of SecurityLogger be passed in as an additional argument. It may be helpful to review the
lecture on collaborator objects for this practice problem.

=end

class QuestionOneTest < Minitest::Test
  class SecurityLogger
    def create_log_entry
      "this is a log entry"
    end
  end

  class SecretFile
    attr_reader :data, :logs

    def initialize(secret_data, logging)
      @data = secret_data
      @logs = logging
    end
  end

  def test_1
    logging = SecurityLogger.new
    file = SecretFile.new("foo bar", logging)
    assert_instance_of(SecurityLogger, file.logs)
  end
end

class QuestionOneTestLSAnswer < Minitest::Test
  class SecurityLogger
    def create_log_entry
      "this is a log entry"
    end
  end

  class SecretFile
    def initialize(secret_data, logging)
      @data = secret_data
      @logging = logging
    end

    def data
      puts @logging.create_log_entry
      @data
    end
  end

  # I was having a hard time understanding what the originators of the
  # problem wanted.  So it was easy to modify the constructor.  However,
  # as the problem statement said, any access to data must also result
  # in a log entry being generated.  This means that the attr_reader
  # must be eliminated and a custom SecretFile#data method must be
  # create which call Logging FIRST and THEN returns data.

  def test_1
    file = SecretFile.new("foo bar", SecurityLogger.new)
    result = ''
    assert_output(/this is a log entry/) { result = file.data }
    assert_equal("foo bar", result)
  end
end
