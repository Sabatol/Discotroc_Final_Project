require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module Discotroc
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.assets.enabled = true
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts")
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts", "lato")
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts", "glyphicons")
    config.assets.paths << Rails.root.join("app", "assets", "images")
    config.assets.paths << Rails.root.join("vendor", "app", "images")
    config.assets.paths << Rails.root.join("vendor", "app", "styles", "modules")
    config.assets.paths << Rails.root.join("vendor", "app", "images", "carousel")
    config.assets.paths << Rails.root.join("vendor", "app", "images", "icons")
    config.assets.paths << Rails.root.join("vendor", "app", "images", "login")
    config.assets.paths << Rails.root.join("vendor", "app", "images", "tile")
    config.assets.paths << Rails.root.join("vendor", "docs", "assets", "images", "carousel")
     config.assets.paths << Rails.root.join("vendor", "docs", "assets", "images", "demo")
     config.assets.paths << Rails.root.join("vendor", "docs", "assets", "images", "getting-started")
     config.assets.paths << Rails.root.join("vendor", "docs", "assets", "images", "icons")
     config.assets.paths << Rails.root.join("vendor", "docs", "assets", "images", "login")
     config.assets.paths << Rails.root.join("vendor", "docs", "assets", "images", "tile")
     config.assets.paths << Rails.root.join("vendor", "docs", "assets", "images", "video")



     # config/application.rb, in order to make it work in Heroku
     config.assets.initialize_on_precompile = false


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
