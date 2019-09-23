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

  def clear
    puts "This will remove all expenses.  Are you sure? (y/n)"
    answer = $stdin.gets.chomp.downcase
    if answer == 'y'
      conn = PG::Connection.new(dbname: DBNAME)
      conn.exec(CLEAR)
      puts "All expenses have been deleted"
      conn.close
    end
  end

  def delete
    conn = PG::Connection.new(dbname: DBNAME)
    result = conn.exec_params(VERIFY_EXPENSE_EXISTS, [cli.id])
    if result.values.empty?
      puts "There was no expense with id '#{cli.id}'"
    else
      conn.exec_params(DELETE, [cli.id])
      puts "The following expense has been deleted:"
      tf.gather_data(result, result.fields, result.values)
      puts tf.print_search_results
    end
  end

  def list
    conn = PG::Connection.new(dbname: DBNAME)
    result = conn.exec(LIST_SQL)

    if result.values.empty?
      puts "There are no expenses"
    else
      tf.gather_data(result, result.fields, result.values)
      puts tf.print_table
    end

    conn.close
  end

  def search
    conn = PG::Connection.new(dbname: DBNAME)
    result = conn.exec_params(SEARCH, ['%' + cli.memo + '%'])

    tf.gather_data(result, result.fields, result.values)
    puts tf.print_search_results

    conn.close
  end

  private

  def add_expense
    conn = PG::Connection.new(dbname: DBNAME)
    if !!cli.datetime
      conn.exec_params(SQL_INSERT_FULL, [cli.amount, cli.memo, cli.datetime])
    else
      conn.exec_params(SQL_INSERT, [cli.amount, cli.memo])
    end

    conn.close
    puts "expense successfully added"
  end
end
