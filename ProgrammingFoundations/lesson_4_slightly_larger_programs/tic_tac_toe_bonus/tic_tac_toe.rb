require 'yaml'
require_relative './board'
include Board
raw_config = File.read('./config.yml')
APP_CONFIG = YAML.load(raw_config)

def ask_for_symbol_prompt
  prompt(APP_CONFIG['PromptForSymbol'])
end

def initialize_game
  puts show_initial_greeting + "\n"
  puts show_instructions + "\n"
  puts Board.show_numbered_board + "\n"
  puts ask_for_symbol_prompt
end

def prompt(message)
  "=> #{message}"
end

def show_initial_greeting
  prompt(APP_CONFIG['InitialGreeting'])
end

def show_instructions
  prompt(APP_CONFIG['Instructions'])
end

# main program

if +__FILE__ == $PROGRAM_NAME
  initialize_game
end
