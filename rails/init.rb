# -*- coding: utf-8 -*-

filename = File.join(Rails.root, 'config', 'oauth_providers.yml')
if File.exists? filename
  require 'yaml'

  source = YAML.load_file(filename)
  ActsAsOauthAccessible.init(source[Rails.env])
end
