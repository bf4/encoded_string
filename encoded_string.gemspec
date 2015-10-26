# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'encoded_string/version'

Gem::Specification.new do |spec|
  spec.name          = "encoded_string"
  spec.version       = EncodedString::VERSION
  spec.authors       = ["Benjamin Fleischer"]
  spec.email         = ["github@benjaminfleischer.com"]

  spec.summary       = %q{Handle string operations without worrying about raising encoding exceptions.}
  spec.description   = %q{Extracted from rspec-support. See https://github.com/rspec/rspec-support/issues/249.}
  spec.homepage      = "https://github.com/bf4/encoded_string"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
