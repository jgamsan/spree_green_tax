# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_green_tax'
  s.version     = '1.3.0'
  s.summary     = 'Add new calculator to spree for tire green tax'
  s.description = 'add new calculator for tire green tax'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Jose Miguel Gamazo'
  s.email     = 'miguel.gamazo@galiclick.com'
  s.homepage  = 'http://www.spreecommerce.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 1.1.0'
end
