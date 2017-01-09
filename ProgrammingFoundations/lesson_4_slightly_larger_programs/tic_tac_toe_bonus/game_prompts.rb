require 'yaml'

module GamePrompts
  raw_config = File.read('./config.yml')
  APP_CONFIG = YAML.load(raw_config)

  def ask_for_another_game
    prompt(APP_CONFIG['AskForAnotherGame'])
  end

  def ask_for_symbol
    prompt(APP_CONFIG['PromptForSymbol'])
  end

  def invalid_continue_game_response
    prompt(APP_CONFIG['InvalidContinueGameQuery'])
  end

  def prompt(message)
    "=> #{message}"
  end

end