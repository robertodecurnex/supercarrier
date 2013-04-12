# -*- encoding: utf-8 -*-

require File.expand_path('../lib/supercarrier/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'supercarrier'
  s.version = Supercarrier::VERSION
  s.summary = 'Deploying Heroku apps 24/7'
  s.description = 'Supercarrier lets you deploy heroku apps on the background, in an isolarted environemnt, so you can keep working over your repo without delays.'
  s.authors = ['Roberto Decurnex']
  s.email = ['decurnex.roberto@gmail.com']
  s.homepage = 'http://robertodecurnex.github.com/supercarrier'

  s.required_ruby_version = '~> 1.9.0'

  s.add_dependency 'git', '~> 1.2.5'
  s.add_dependency 'heroku-api', '~> 0.3.0'
  s.add_dependency 'trollop', '~> 2.0.0'

  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'rake', '~> 10.0.4'
  s.add_development_dependency 'rspec', '~> 2.13.0'
end
