# -*- encoding: utf-8 -*-
require File.expand_path('../lib/redcarpet/variables/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Simon COURTOIS"]
  gem.email         = ["scourtois@cubyx.fr"]
  gem.description   = %q{Variables for Redcarpet}
  gem.summary       = %q{Brings variables from any source to your Markdown templates}
  gem.homepage      = "http://github.com/simonc/redcarpet-variables"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "redcarpet-variables"
  gem.require_paths = ["lib"]
  gem.version       = Redcarpet::Variables::VERSION

  gem.add_dependency 'redcarpet', '~> 2.0'

  gem.add_development_dependency 'rspec'
end
