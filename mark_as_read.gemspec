# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mark_as_read/version'

Gem::Specification.new do |spec|
  spec.name          = "mark_as_read"
  spec.version       = MarkAsRead::VERSION
  spec.authors       = ["Adrien Siami"]
  spec.email         = ["adrien@siami.fr"]
  spec.summary       = "Allows to easily track when an e-mail has been opened"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "coveralls"


  spec.add_dependency("rails", ">= 3.2.6", "< 5")
end
