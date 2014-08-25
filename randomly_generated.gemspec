# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'randomly_generated/version'

Gem::Specification.new do |spec|
  spec.name          = "randomly_generated"
  spec.version       = RandomlyGenerated::VERSION
  spec.authors       = ["Craig Buchek"]
  spec.email         = ["craig@boochtek.com"]
  spec.summary       = %q{Randomly generate different kinds of data}
  spec.description   = %q{Randomly generate data, to use with property-based tests}
  spec.homepage      = "https://github.com/boochtek/randomly_generated"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubygems-tasks"
end
