# frozen_string_literal: true
require_relative "lib/db_helper/version"

Gem::Specification.new do |spec|
  spec.name          = "db_helper"
  spec.version       = DbHelper::VERSION
  spec.authors       = ["Aman Agrawal"]
  spec.email         = ["amanagrawal5438@email.com"]

  spec.summary       = "A simple Ruby gem for database helper utilities"
  spec.description   = "Helps check table existence, create tables, and insert data dynamically."
  spec.homepage      = "https://example.com"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activerecord", ">= 6.0"
  spec.add_runtime_dependency "pg"
  spec.add_runtime_dependency "mysql2"


  spec.add_development_dependency "rspec"
end
