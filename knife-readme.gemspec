# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "knife-readme"
  spec.version       = "0.1.0"
  spec.authors       = ["Brandon Raabe"]
  spec.email         = ["brandocorp@gmail.com"]
  spec.summary       = %q{Cookbook README generator.}
  spec.description   = %q{Generate a cookbook's readme from its metadata.}
  spec.homepage      = ""
  spec.license       = "apachev2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'chef', '~> 11.0'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'pry'
end
