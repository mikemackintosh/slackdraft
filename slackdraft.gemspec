# Created by hand, like a real man
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slackdraft/version'

Gem::Specification.new do |s|

  s.name        = 'slackdraft'
  s.version     = Slackdraft::VERSION
  s.date        = '2015-02-14'
  s.summary     = "Slack messaging with half the Kurt Russell"
  s.description = "Slack messaging with half the Kurt Russell"
  s.authors     = ["Mike Mackintosh"]
  s.email       = 'm@zyp.io'
  s.homepage    =
    'http://github.com/mikemackintosh/slackdraft'

  s.license       = 'MIT'
  
  s.require_paths = ["lib"]
  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency 'httparty'
  s.add_dependency 'fattr'
  s.add_dependency 'paint'
  s.add_dependency 'methadone'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"

end