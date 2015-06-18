# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth-sportngin/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-sportngin'
  s.version  = OmniAuth::SportNgin::VERSION
  s.authors  = ['Jon Phenow']
  s.email    = ['jon.phenow@sportngin.com']
  s.summary  = 'Sport Ngin strategy for OmniAuth'
  s.homepage = 'https://github.com/sportngin/omniauth-sportngin'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'omniauth', '~> 1.0'
  s.add_dependency 'omniauth-oauth2', '~> 1.0'

  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
