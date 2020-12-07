require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ListShare
  class Application < Rails::Application
    config.load_defaults 6.0
   
    #日本語化
    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'
  end
end
