$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_grid/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_grid"
  s.version     = RailsAdminGrid::VERSION
  s.authors     = ["Michael Colavita"]
  s.email       = ["colavitam@gmail.com"]
  s.homepage    = "https://github.com/colavitam/rails_admin_grid"
  s.summary     = "A custom RailsAdmin action to display objects in a grid."
  s.description = "RailsAdminGrid is a custom action for RailsAdmin that displays objects in a grid with thumbnails. It provides an alternative to the default list view provided in RailsAdmin."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "rails_admin", ">= 0.8.0"
end
