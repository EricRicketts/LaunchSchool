require 'yaml'

module GamePrompts
  raw_config = File.read('./config.yml')
  APP_CONFIG = YAML.load(raw_config)

  def ask_for_symbol_prompt
    prompt(APP_CONFIG['PromptForSymbol'])
  end

  def prompt(message)
    "=> #{message}"
  end

end