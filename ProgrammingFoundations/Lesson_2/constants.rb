require 'yaml'

# constants for calculator program
module Constants

  raw_config = File.read('./config.yml')
  APP_CONFIG = YAML.load(raw_config)

  FIRST_NUMBER_MSG = APP_CONFIG['OneLineMessages']['FirstNumberMessage']
  SECOND_NUMBER_MSG = APP_CONFIG['OneLineMessages']['SecondNumberMessage']
  REPEAT_CALC_MSG = APP_CONFIG['OneLineMessages']['RepeatCalculationMessage']
  OPERATOR_PROMPT = APP_CONFIG['MultiLineMessages']['OperatorPrompt']

  OPERATOR_HASH = {
    '1' => 'Adding', '2' => 'Subtracting',
    '3' => 'Multiplying', '4' => 'Dividing'
  }

end
