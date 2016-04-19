$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stable"
  s.version     = Stable::VERSION
  s.authors     = ["Cronos"]
  s.email       = ["lexsandr46@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Stable."
  s.description = "TODO: Description of Stable."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"

  s.add_development_dependency "sqlite3"
end
