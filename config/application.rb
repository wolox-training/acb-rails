require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module AcbRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Use I18n fallbacks
    config.i18n.fallbacks = true
    I18n.locale = :en
    config.action_view.raise_on_missing_translations = false
        config.i18n.load_path += Dir[File.join(::Rails.root, 'config', 'locales', '**', '*.{rb,yml}')]
  end
end
