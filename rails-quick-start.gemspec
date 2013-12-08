# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/quick/start/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-quick-start"
  spec.version       = Rails::Quick::Start::VERSION
  spec.authors       = ["RKiel"]
  spec.email         = ["cygnus@pobox.com"]
  spec.description   = %q{Quickly start a Rails app}
  spec.summary       = %q{Quickly start a Rails app}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
