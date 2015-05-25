# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'statistik/version'

Gem::Specification.new do |spec|
  spec.name          = "statistik"
  spec.version       = Statistik::VERSION
  spec.authors       = ["João Fraga"]
  spec.email         = ["jgfraga@gmail.com"]
  spec.summary       = %q{A ruby wrapper to AppProva Statistics Service}
  spec.description   = %q{A ruby wrapper to AppProva Statistics Service}
  spec.homepage      = "http://appprova.com.br"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json", ">= 1.4.0"
  spec.add_dependency "httparty"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
