$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'traffic_source_parser'
require 'pry'
require "codeclimate-test-reporter"

CodeClimate::TestReporter.start