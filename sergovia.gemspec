# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sergovia/version'

Gem::Specification.new do |spec|
  spec.name          = "sergovia"
  spec.version       = Sergovia::VERSION
  spec.authors       = ["Joe Cannatti"]
  spec.email         = ["joecannatti@gmail.com"]
  spec.summary       = %q{A gem to calculate the playability of chords on guitar}
  spec.description   = %q{Sergovia is a Ruby implementation of an alogrithm that computes how playable a chord is on the guitar.}
  spec.homepage      = ""
  spec.license       = "GPL-2.0+"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
