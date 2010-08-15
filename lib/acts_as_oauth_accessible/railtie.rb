module ActsAsOauthAccessible
  class Railtie < Rails::Railtie
    initializer "acts_as_oauth_accessible.configure_rails_initialization" do |app|
      filename = File.join(Rails.root, 'config', 'oauth_providers.yml')
      if File.exists? filename
        require 'yaml'
        source = YAML.load_file(filename)
        ActsAsOauthAccessible.init(source[Rails.env])
      end
    end
    
    generators do
      require File.join(File.dirname(__FILE__), '..', 'generators', 'acts_as_oauth_accessible_generator')
    end
  end
end
