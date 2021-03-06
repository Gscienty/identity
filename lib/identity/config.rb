module Identity
  module Config
    extend self

    def cookie_encryption_key
      ENV.fetch("COOKIE_ENCRYPTION_KEY")
    end

    def old_cookie_encryption_key
      ENV["OLD_COOKIE_ENCRYPTION_KEY"]
    end

    def heroku_root_domain_cookie_encryption_key
      ENV.fetch("HEROKU_ROOT_DOMAIN_COOKIE_ENCRYPTION_KEY")
    end

    def old_heroku_root_domain_cookie_encryption_key
      ENV["OLD_HEROKU_ROOT_DOMAIN_COOKIE_ENCRYPTION_KEY"]
    end

    def cookie_expire_after
      ENV.fetch("COOKIE_EXPIRE_AFTER", 2592000).to_i
    end

    def dashboard_url
      ENV.fetch("DASHBOARD_URL")
    end

    def sso_base_url
      ENV["SSO_BASE_URL"]
    end

    def heroku_api_url
      ENV.fetch("HEROKU_API_URL")
    end

    def heroku_oauth_id
      ENV.fetch("HEROKU_OAUTH_ID")
    end

    def heroku_oauth_secret
      ENV.fetch("HEROKU_OAUTH_SECRET")
    end

    def heroku_cookie_domain
      ENV.fetch("HEROKU_COOKIE_DOMAIN", ".heroku.com")
    end

    def mixpanel_token
      ENV["MIXPANEL_TOKEN"]
    end

    def google_tag_manager_account
      ENV["GOOGLE_TAG_MANAGER_ACCOUNT"]
    end

    def login_external_secret
      ENV["LOGIN_EXTERNAL_SECRET"]
    end

    def rollbar_access_token
      ENV["ROLLBAR_ACCESS_TOKEN"]
    end

    def rack_env
      ENV.fetch("RACK_ENV", "development")
    end

    def development?
      rack_env == "development"
    end

    def production?
      rack_env == "production"
    end

    def redirect_all_signups
      !ENV["REDIRECT_ALL_SIGNUPS"].nil?
    end

    def release
      @release ||= ENV.fetch("RELEASE",  "1")
    end

    def root
      @root ||= File.expand_path("../../../", __FILE__)
    end

    def signup_url
      ENV.fetch("SIGNUP_URL")
    end

    # useful for staging environments with less-than-valid certs
    #   e.g. api.staging.herokudev.com
    def ssl_verify_peer?
      ENV["SSL_VERIFY_PEER"] != "false"
    end

    def parse_oauth_client_id
      "17ae0773-297f-4437-a640-e70f464ff9f4"
    end
  end
end
