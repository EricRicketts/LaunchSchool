require_relative './cli_constants'

class Cli
  include CliConstants
  attr_reader :args, :command, :amount, :memo, :datetime

  def initialize(args)
    @args = args
    @command = args[0]
    @amount = args[1]
    @memo = args[2]
    @datetime = args[3]
  end

  def check_add_arguments
    correct_number_of_add_arguments? &&
    amount_format_correct? &&
    datetime_format_correct?
  end

  def valid_command?
    RECOGNIZED_COMMANDS.include?(command)
  end

  private

  def amount_format_correct?
    amount.match?(/^\d+\.\d{2}$/)
  end

  def correct_number_of_add_arguments?
    [3, 4].include?(args.size)
  end

  def datetime_format_correct?
    !datetime.nil? && datetime.match?(/^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}-\d{2}$/)
  end
end
