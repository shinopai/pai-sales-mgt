require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # デフォルトロケール
    config.i18n.available_locales = [:ja, :en]
    config.i18n.default_locale = :ja

    # バリデーションエラーが出た際のレイアウト崩れ防止
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
