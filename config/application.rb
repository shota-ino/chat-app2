# そのRailsアプリケーションの開発環境すべてにおいて共通となる設定を記述 #

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatApp2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # 設定ファイルで時刻を日本時刻に変更→その後メソッドを用いて時刻を表示
    # config/localesディレクトリに「ja.yml」を参照しに行ってる
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    # 必要のないファイルですので、設定を変更（追記）して生成させない
    config.generators do |g|
      # 生成したファイルに対応したスタイルシート
      g.stylesheets false
      # 生成したファイルに対応したJavaScriptファイル
      g.javascripts false
      # 生成したファイルに対応したヘルパー
      g.helper false
      # アプリケーションをテストするためのファイル
      g.test_framework false
    end
  end
end
