require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require 'action_cable/engine'
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "attachinary/orm/active_record"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OnTop
  class Application < Rails::Application
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.generators do |generate|
      generate.assets false
    end
    config.react.addons = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
