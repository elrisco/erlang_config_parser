# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'erlang_config_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "erlang_config_parser"
  spec.version       = ErlangConfigParser::VERSION
  spec.authors       = ["elrisco"]
  spec.email         = ["elrisco@gmail.com"]

  spec.summary       = %q{ErlangConfigParser can parse Erlang configs into Ruby objects.}
  spec.homepage      = "https://github.com/elrisco/erlang_config_parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "racc"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.15.0"
  # spec.add_development_dependency "rspec", "~> 3.0"
end
