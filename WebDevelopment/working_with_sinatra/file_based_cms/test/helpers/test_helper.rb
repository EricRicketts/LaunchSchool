ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'fileutils'
require 'bcrypt'
require 'pry-byebug'
require_relative '../../cms'
