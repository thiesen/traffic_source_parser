# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'traffic_source_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "traffic_source_parser"
  spec.version       = TrafficSourceParser::VERSION
  spec.authors       = ["thiesen"]
  spec.email         = ["nathan.thiesen@outlook.com"]

  spec.summary       = %q{UTM Alternative Parser}
  spec.description   = %q{A parser gem to get UTM Alternative source info from leads}
  spec.homepage      = "https://github.com/thiesen/traffic_source_parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "public_suffix"
end
