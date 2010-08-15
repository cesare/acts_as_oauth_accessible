# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_oauth_accessible}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["SAWADA Tadashi"]
  s.date = %q{2010-08-15}
  s.description = %q{Rails plugin that enables your models to access OAuth services}
  s.email = %q{cesare@mayverse.jp}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "acts_as_oauth_accessible.gemspec",
     "init.rb",
     "lib/acts_as_oauth_accessible.rb",
     "lib/acts_as_oauth_accessible/railtie.rb",
     "lib/generators/acts_as_oauth_accessible_generator.rb",
     "lib/generators/templates/config/oauth_providers.yml",
     "lib/generators/templates/db/migration.rb",
     "rails/init.rb"
  ]
  s.homepage = %q{http://github.com/cesare/acts_as_oauth_accessible}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{enables your Rails models to OAuth-access}
  s.test_files = [
    "spec/acts_as_oauth_accessible_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_runtime_dependency(%q<oauth>, [">= 0.4.0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<oauth>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<oauth>, [">= 0.4.0"])
  end
end

