require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LearnWebpacker
  class Application < Rails::Application


    config.global_vars = YAML.load_file(
      "#{ Rails.root.to_s }/config/config.yml"
    ).deep_merge(
      YAML.load_file(
        "#{ Rails.root.to_s }/config/config_#{ Rails.env }.yml"
      )
    ).with_indifferent_access

    config.redis_credential_hash = {
      host:       config.global_vars[:redis][:host],
      port:       config.global_vars[:redis][:port],
      db:         0,
      namespace:  "rainmaker-#{ Rails.env }",
      expires_in: 1.days
    }
    config.redis_credential_hash.merge!( password: config.global_vars[:redis][:password] ) unless config.global_vars[:redis][:password].blank?

    config.to_prepare do
      DeviseController.respond_to :json
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
