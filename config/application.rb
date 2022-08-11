require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ORG
  NAME = 'BGM'
  DESCRIPTION = "BGM's Website"
  DOMAIN = 'bgm.cl'
  EMAIL = 'noreply@bgm.cl'
  SMTP = "smtp.mailgun.org"
  GITHUB = 'https://github.com/BGMP/BGM'
  GIT_REPO = 'BGM'
  GIT_ISSUES = 'https://github.com/BGMP/BGM/issues'
end

module BGM
  class Application < Rails::Application
    class << self
      def bgm_role
        ENV['BGM_ROLE'] || 'bgm'
      end

      def bgm_role=(role)
        unless role == bgm_role
          ENV['BGM_ROLE'] = role
          Rails.application.reload_routes! if Rails.application
        end
      end
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Gracefully handle website exceptions such as 404, 422 & 500. All through the ErrorsController
    config.exceptions_app = routes

    config.time_zone = 'Central Time (US & Canada)'

    config.assets.paths << Rails.root.join('app', 'assets')

    config.assets.prefix = 'dev-assets'
  end
end
