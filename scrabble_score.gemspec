# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scrabble_score/version'

Gem::Specification.new do |spec|
  spec.name          = 'scrabble_score'
  spec.version       = ScrabbleScore::VERSION
  spec.authors       = ['Nick Aschenbach']
  spec.email         = ['nick.aschenbach@gmail.com']
  spec.summary       = %q{A scrabble cheater scoring library}
  spec.description   = %q{An engine that finds words from a set of letters and calculates the scrabble score}
  spec.homepage      = 'https://github.com/nick-aschenbach/scrabble-score'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rspec', '3.0.0'
  spec.add_development_dependency 'simplecov', '0.9.1'
end
