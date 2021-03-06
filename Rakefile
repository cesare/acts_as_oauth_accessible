require 'rubygems'
require 'rake'
gem 'rspec', '>= 1.2.9', '< 1.9.9'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "acts_as_oauth_accessible"
    gem.summary = %Q{enables your Rails models to OAuth-access}
    gem.description = %Q{Rails plugin that enables your models to access OAuth services}
    gem.email = "cesare@mayverse.jp"
    gem.homepage = "http://github.com/cesare/acts_as_oauth_accessible"
    gem.authors = ["SAWADA Tadashi"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency "oauth", ">= 0.4.0"
    gem.files = FileList['lib/**/*', 'generators/**/*', 'rails/**/*', 'init.rb', 'LICENSE', 'README.rdoc', 'Rakefile', 'VERSION', '*.gemspec'].to_a
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "acts_as_oauth_accessible #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
