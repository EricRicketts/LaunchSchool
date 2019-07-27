require 'pry-byebug'
require 'pg'
require_relative './cli_constants'

class ExpenseData
  include CliConstants
  DBNAME = 'rb185'
  attr_reader :cli, :tf

  def initialize(cli, tf)
    @cli = cli
    @tf = tf
  end

  def add
    error_str = "incorrect number of add arguments or flawed argument format"
    cli.check_add_arguments ? add_expense : (puts error_str)
  end


  def list
    conn = PG::Connection.new(dbname: DBNAME)
    result = conn.exec(LIST_SQL)

    tf.gather_data(result, result.fields, result.values)
    puts tf.print_table

    conn.close
  end

  private

  def add_expense
    conn = PG::Connection.new(dbname: DBNAME)
    conn.exec_params(SQL_INSERT, [cli.amount, cli.memo, cli.datetime])

    conn.close
    puts "expense successfully added"
  end
end
