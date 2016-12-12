require 'yaml'

raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def prompt(message)
  "=> #{message}"
end

def ask_for_symbol_prompt
  prompt(APP_CONFIG['PromptForSymbol'])
end

def show_initial_greeting
  prompt(APP_CONFIG['InitialGreeting'])
end

def show_instructions
  prompt(APP_CONFIG['Instructions'])
end