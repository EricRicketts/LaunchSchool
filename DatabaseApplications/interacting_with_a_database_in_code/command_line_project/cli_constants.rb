module CliConstants
  DESIRED_ORDER = %w[id created_on amount memo]
  AMOUNT = DESIRED_ORDER[2]

  RECOGNIZED_COMMANDS = %w[add clear delete list search]

  LIST_SQL = <<-SQL_LIST
  SELECT #{DESIRED_ORDER.join(', ')}
  FROM expenses
  ORDER BY id;
  SQL_LIST

  HELP = <<-HELP_DOC
  An expense recording system

  Commands:

  add AMOUNT MEMO [DATE] - record a new expense
  AMOUNT - required, must be a number with at least one digit
  before the decimal and two digits after the decimal
  MEMO - required, must be in quotes if more than one word
  DATE - optional, must be in quotes and formated as
  "yyyy-mm-dd hh:mm:ss-tz" where tz is the timezone which
  must be 2 digits, example "2019-01-15 12:23:14-04"

  You must have at least 2 arguments but no more than 3

  clear - delete all expenses

  delete NUMBER - remove expense with id NUMBER, NUMBER is required

  list - list all expenses

  search QUERY - list expenses with a matching MEMO field, QUERY
  is required and must be in quotes

  program returns an information message if input parameters
  do not match the command syntax
  HELP_DOC

  INFO_MSG = <<-INFO_MSG
  Incorrect input, consider running './expense'
  with no arguments to get a list of viable commands.
  INFO_MSG

  SQL_INSERT = <<-SQL_INSERT_TEXT
  INSERT INTO expenses (amount, memo, created_on)
  VALUES
  ($1, $2, $3);
  SQL_INSERT_TEXT

  SEARCH = <<-SQL_SEARCH
  SELECT #{DESIRED_ORDER.join(', ')}
  FROM expenses
  WHERE memo ILIKE $1;
  SQL_SEARCH
end
