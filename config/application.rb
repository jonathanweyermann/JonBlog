require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)




module RBlog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.image_bucket = ENV['IMAGE_BUCKET']
    config.aws_access_key = ENV['AWS_ACCESS_KEY_ID']
    config.aws_secret_key = ENV['AWS_SECRET_ACCESS_KEY']
    config.aws_region = ENV['AWS_REGION']

    config.paperclip_defaults = {
     storage: :s3,
     s3_host_name: 's3-us-west-2.amazonaws.com',
     s3_credentials: {
       bucket: config.image_bucket,
       access_key_id: config.aws_access_key,
       secret_access_key: config.aws_secret_key,
       s3_region: config.aws_region
     }
   }
   config.active_record.raise_in_transactional_callbacks = true
   config.cloudfront_host = "https://dqdeqb9vb8p5i.cloudfront.net"
   config.s3_bucket_url = '//s3-us-west-2.amazonaws.com/jonathanweyermannblog'
   config.middleware.use PDFKit::Middleware, {}, :only => %r[^/resume_print]
  end
end
