require "codeclimate-test-reporter"

# CodeClimate::TestReporter.start

require 'traffic_source_parser'
require 'pry'
require 'rspec'

Dir["./spec/support/*.rb"].each {|f| require f}

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
