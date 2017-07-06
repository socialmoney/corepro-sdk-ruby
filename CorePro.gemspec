# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'corepro/version'

Gem::Specification.new do |spec|
  spec.name          = 'corepro'
  spec.version       = CorePro::VERSION
  spec.authors       = ['devsupport']
  spec.email         = ['devsupport@socialmoney.com']
  spec.summary       = %q{A Ruby SDK for consuming the CorePro API.}
  spec.description   = %q{See https://docs.corepro.io for more detail.}
  spec.homepage      = 'https://github.com/socialmoney/corepro-sdk-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '~> 2.4'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit', '~> 3.2'
end
