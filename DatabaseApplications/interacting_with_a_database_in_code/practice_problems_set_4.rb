require 'pg'

# Practice Problems
# 1.  What happens if you use two placeholders in the first argument to
# PG::Connection#exec_params, but only one in the Array of values used
# to fill in those placeholders?

conn = PG::Connection.new(dbname: 'rb185')
p conn.exec_params("SELECT 1 + $1 + $2;", [4]).values

=begin
returns an error:

Traceback (most recent call last):
  1: from practice_problems_set_4.rb:9:in `<main>'
practice_problems_set_4.rb:9:in `async_exec_params':
ERROR:  bind message supplies 1 parameters, but prepared statement "" requires 2 (PG::ProtocolViolation)

You must have matching parameters, it still fails if you have more than
2 parameters in this case.
=end

# 2.  Update the code within the add_expense method to use exec_params instead of exec.

def add_expense(amount, memo, conn)
  date_time = DateTime.now
  sql = "INSERT INTO expenses (amount, memo, created_on) VALUES ($1, $2, $3);"
  conn.exec_params(sql, [amont, memo, date_time])
end

# 3.  What happens when the same malicious arguments are passed to the program now?

# the arguments are safely converted to strings so the SQL program will not
# execute them
# ./expense add 0.01 "', '2015-01-01'); DROP TABLE expenses; --"
# $ ./expense list
#  1 | 2016-06-22 |         0.01 | ', '2015-01-01'); DROP TABLE expenses; --