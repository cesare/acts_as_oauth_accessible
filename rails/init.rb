# -*- coding: utf-8 -*-

require 'yaml'

source = YAML.load_file(File.join(Rails.root, 'config', 'oauth_providers.yml'))
ActsAsOauthAccessible.init(source[Rails.env])
