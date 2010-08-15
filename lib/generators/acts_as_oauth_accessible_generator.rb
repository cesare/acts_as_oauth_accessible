require 'rails/generators/migration'
require 'rails/generators/active_record'

class ActsAsOauthAccessibleGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end  
  
  def self.next_migration_number(path)
    ActiveRecord::Generators::Base.next_migration_number(path)
  end
  
  def copy_config_files
    copy_file('config/oauth_providers.yml', 'config/oauth_providers.yml')
  end
  
  def copy_migration_file
    migration_template 'db/migration.rb', 'db/migrate/create_consumer_tokens'
  end
end