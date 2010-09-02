require 'oauth'

if defined?(Rails) && Rails.version >= '3.0.0'
  require File.join(File.dirname(__FILE__), "acts_as_oauth_accessible", "railtie")
end


module ActsAsOauthAccessible
  def self.init(hash)
    @config = Config.new(hash)
    if defined? ActiveRecord::Base
      ActiveRecord::Base.send :include, ActsAsOauthAccessible
    end
  end
  
  def self.config
    @config
  end
  
  module ClassMethods
    def acts_as_oauth_consumer
      self.send :include, InstanceMethods
      self.class_eval do
        has_many :consumer_tokens, :as => :oauth_accessible
        has_many :consumer_access_tokens, :as => :oauth_accessible
      end
    end
  end
  
  module InstanceMethods
    def oauth_access(name)
      consumer = oauth_consumer_for(name)
      token = self.consumer_access_tokens.find_by_provider(name.to_s)
      unless token
        raise ArgumentError, "No OAuth access token: user=#{self.id}, provider=#{name}"
      end
      OAuth::AccessToken.new(consumer, token.token, token.secret)
    end
    
    def oauth_consumer_for(name)
      provider = get_oauth_provider_config_for(name)
      provider.create_consumer
    end
    
    private
    def get_oauth_provider_config_for(name)
      conf = ActsAsOauthAccessible.config.provider(name)
      unless conf
        raise ArgumentError, "No OAuth provider configuration found for #{name}"
      end
      conf
    end
    
  end
  
  def self.included(base)
    base.send :extend, ClassMethods
  end
  
  class Config
    def initialize(entries = {})
      @providers = {}
      entries.each {|k,v| @providers[k.to_sym] = OAuthProvider.new(k.to_s, v) }
    end
    
    def provider(name)
      @providers[name.to_sym]
    end
    
    class OAuthProvider
      attr_reader :name, :key, :secret, :options
      def initialize(name, entry = {})
        @name   = name
        @key    = entry['key']
        @secret = entry['secret']
        @options = entry['options']
      end
      
      def create_consumer
        OAuth::Consumer.new(key, secret, options)
      end
    end
  end
end
