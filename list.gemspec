# -*- encoding: utf-8 -*-
require File.expand_path('../lib/list/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gary Gordon"]
  gem.email         = ["gfgordon@gmail.com"]
  gem.description   = %q{Extremely simple list manager}
  gem.summary       = %q{Extremely simple list manager}
  gem.homepage      = ''

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "list"
  gem.require_paths = ['lib']
  gem.version       = List::VERSION
end
