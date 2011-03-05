# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gitdummy/version"

Gem::Specification.new do |s|
  s.name        = "gitdummy"
  s.version     = Gitdummy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = %w(aekym)
  s.email       = %w(me@aekym.com)
  s.homepage    = "http://aekym.com"
  s.summary     = %q{Small helper for a better start with git}
  s.description = %q{'gitdummy' should help a fresh git user to make sure the config is correct and the current branch cares about public conventions.}

  s.rubyforge_project = "gitdummy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('grit', '>= 2.4.1')
  s.add_dependency('thor', '>= 0.14.6')
end

