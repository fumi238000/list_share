require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module ListShare
  class Application < Rails::Application
    config.load_defaults 6.0
    #日本語化
    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'
    # config.factory_bot.definition_file_paths = ["spec/factories"]
  end
end
