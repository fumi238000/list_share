# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module ListShare
  class Application < Rails::Application
    config.load_defaults 6.0
    # 日本語化
    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
  end
end
