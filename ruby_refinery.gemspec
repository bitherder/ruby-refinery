# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_refinery/version'

Gem::Specification.new do |spec|
  spec.name                  = "ruby_refinery"
  spec.version               = RubyRefinery::VERSION
  spec.authors               = ["Larry Baltz"]
  spec.email                 = ["larry@baltz.org"]

  spec.summary               = (Pathname(__FILE__).dirname+'README.md').readlines[2].strip
  spec.description           = (Pathname(__FILE__).dirname+'README.md').readlines[4].strip
  spec.homepage              = "https://github.com/bitherder/ruby_refinery"

  spec.required_ruby_version = '~> 2.0'

  spec.files                 = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir                = "exe"
  spec.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths         = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
