module ActsAsOauthAccessible
  class Railtie < Rails::Railtie
    initializer "acts_as_oauth_accessible.configure_rails_initialization" do |app|
      require 'yaml'
      source = YAML.load_file(File.join(Rails.root, 'config', 'oauth_providers.yml'))
      ActsAsOauthAccessible.init(source[Rails.env])
    end
  end
end
