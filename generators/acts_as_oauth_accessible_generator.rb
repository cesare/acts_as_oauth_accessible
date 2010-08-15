class ActsAsOauthAccessibleGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.template 'config/oauth_providers.yml', 'config/oauth_providers.yml'
      
      m.migration_template 'db/migration.rb', 'db/migrate', :assigns => {
          :migration_name => "CreateConsumerTokens"
        }, :migration_file_name => "create_consumer_tokens"
    end
  end
  
end
