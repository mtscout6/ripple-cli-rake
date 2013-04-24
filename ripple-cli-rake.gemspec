# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ripple-cli/rake/version'

Gem::Specification.new do |spec|
  spec.name          = "ripple-cli-rake"
  spec.version       = Ripple::Rake::VERSION
  spec.authors       = ["Jeremy Miller", "Josh Arnold", "Ryan Rauh", "Matthew Smith"]
  spec.email         = ["fubumvc-devel@googlegroups.com"]
  spec.description   = %q{Wraps the ripple command line parameters with classes and provides rake tasks}
  spec.summary       = %q{Rake tasks for use with ripple-cli}
  spec.homepage      = "http://fubu-project.org"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "ripple-cli"
end
