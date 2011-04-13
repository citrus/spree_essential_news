# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spree_essential_news/version"

Gem::Specification.new do |s|
  s.name        = "spree_essential_news"
  s.version     = SpreeEssentialNews::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spencer Steffen"]
  s.email       = ["spencer@citrusme.com"]
  s.homepage    = "https://github.com/citrus/spree_essential_news"
  s.summary     = %q{Spree Essential News is a news plugin for Spree sites equipped with spree_essentials.}
  s.description = %q{Spree Essential News is a news plugin for Spree sites equipped with spree_essentials.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  
  s.add_dependency('spree_essentials', '>= 0.1.0')

  s.require_paths = ["lib"]
end
