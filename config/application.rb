require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)
module LibraryManagement01
  class Application < Rails::Application
    config.i18n.default_locale = :en
  end
end
