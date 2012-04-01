# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'ruby_soccer/version'

Gem::Specification.new do |s|
  s.name          = "ruby_soccer"
  s.version       = RubySoccer::VERSION
  s.authors       = ["Basar Erdivanli"]
  s.email         = ["berdivanli@gmail.com"]
  s.homepage      = ""
  s.summary       = %q{TODO: Write a gem summary}
  s.description   = %q{TODO: Write a gem description}

  s.files         = `git ls-files`.split($\)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
