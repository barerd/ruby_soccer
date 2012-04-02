# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'ruby_soccer/version'

Gem::Specification.new do |s|
  s.name          = "ruby_soccer"
  s.version       = ruby_soccer::VERSION
  s.authors       = ["Basar Erdivanli"]
  s.email         = ["berdivanli@gmail.com"]
  s.homepage      = ""
  s.summary       = %q{Simple soccer game where two pre-determined teams match.}
  s.description   = %q{Simple soccer game where two pre-determined teams match. The match function calculates probabilities of goals and fauls for each minute and reports them in the end.}

  s.files         = `git ls-files`.split($\)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
