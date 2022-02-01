Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  Rails.application.configure do

    #default url

    #Action MailerのビューでURLを生成する
    config.action_mailer.default_url_options={
      protocol: 'https',
      host: ENV["CLOUD9_APP_ROOT_URL"]
    }


    #mail setting

    #メール配信に失敗した場合にエラーを発生するかどうかを指定します
    config.action_mailer.raise_delivery_errors = true

    #配信方法を指定します。以下の配信方法を指定可能です
    config.action_mailer.delivery_method = :smtp

    #:smtpの配信メソッドの詳細設定を行います。
    config.action_mailer.smtp_settings = {

      #リモートメールサーバーの利用を許可する
      :address => "smtp.gmail.com",

      #メールサーバーが万一ポート25番で動作していない場合はここで変更する。
      :port => 587,

      #メールサーバーで認証が必要な場合はここでユーザー名を指定する。
      :user_name => ENV["GMAIL_ADDRESS"],

      #メールサーバーで認証が必要な場合、ここでパスワードを指定する
      :password => ENV["GMAIL_2FACTOR_PASSWORD"],

      #メールサーバーで認証が必要な場合はここで認証の種類を指定する。:plain（パスワードを平文で送信）、:login（パスワードをBase64でエンコードする）、:cram_md5（チャレンジ/レスポンスによる情報交換と、MD5アルゴリズムによる重要情報のハッシュ化の組み合わせ）のいずれかのシンボルを指定する。
      :authentication => :plain,

      #SMTPサーバーでSTARTTLSが有効かどうかを検出して有効にする。デフォルトはtrue。
      :enable_starttls_auto => true
    }
  end
end
