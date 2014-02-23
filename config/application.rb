require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Releaser
  class Application < Rails::Application
    # Sprockets configuration
    config.assets.precompile += %w(application.js application.css)
		config.assets.initialize_on_precompile = false

    # General Rails configuration
    config.encoding = 'utf-8'

    # Handlebars configuration
    config.handlebars.templates_root = %w(releaser/templates)
  end
end
