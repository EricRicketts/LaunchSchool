require 'yaml'

# constants for calculator program
module Constants
  raw_config = File.read('./config.yml')
  APP_CONFIG = YAML.load(raw_config)

  WELCOME_MSG = APP_CONFIG['OneLineMessages']['WelcomeMessage']
  GOOD_BYE_MSG = APP_CONFIG['OneLineMessages']['GoodByeMessage']
  NAME_ERROR_MSG = APP_CONFIG['OneLineMessages']['NameErrorMessage']
  NUMBER_ERROR_MSG = APP_CONFIG['OneLineMessages']['NumberErrorMessage']
  FIRST_NUMBER_MSG = APP_CONFIG['OneLineMessages']['FirstNumberMessage']
  SECOND_NUMBER_MSG = APP_CONFIG['OneLineMessages']['SecondNumberMessage']
  REPEAT_CALC_MSG = APP_CONFIG['OneLineMessages']['RepeatCalculationMessage']
  OPERATOR_CHOICE = APP_CONFIG['OneLineMessages']['OperatorChoiceMessage']
  DIVIDE_BY_ZERO_MSG = APP_CONFIG['OneLineMessages']['DivideByZeroMessage']

  OPERATOR_PROMPT = APP_CONFIG['MultiLineMessages']['OperatorPrompt']

  OPERATOR_HASH = {
    '1' => 'Adding', '2' => 'Subtracting',
    '3' => 'Multiplying', '4' => 'Dividing'
  }
end
