# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ncd/version'

Gem::Specification.new do |spec|
  spec.name          = "ncd"
  spec.version       = NCD::VERSION
  spec.authors       = ["Masata Nishida"]
  spec.email         = ["masatanish@gmail.com"]
  spec.description   = %q{gem for calculating Normalized Compression Distance.}
  spec.summary       = %q{gem for calculating Normalized Compression Distance.}
  spec.homepage      = "https://github.com/masatanish/ncd"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">=2.13.0"
end
