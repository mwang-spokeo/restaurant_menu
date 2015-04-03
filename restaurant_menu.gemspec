$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "restaurant_menu/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "restaurant_menu"
  s.version     = RestaurantMenu::VERSION
  s.authors     = ["Man Wang"]
  s.email       = ["mwang@spokeo.com"]
  s.homepage    = ""
  s.summary     = "Manage the Menu of the Restaurant."
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "haml"
  s.add_dependency "jquery-rails"
  s.add_dependency "bootstrap-rails-engine"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "3.0.0.beta2"
  s.add_development_dependency "factory_girl_rails", "4.4.1"
  s.add_development_dependency "byebug"
end
