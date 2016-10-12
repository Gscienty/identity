module Identity
  class Assets < Sinatra::Base
    register ErrorHandling

    def initialize(*args)
      super
      path = "#{Config.root}/assets"
      @assets = Sprockets::Environment.new do |env|
        Identity.log :assets, path: path

        env.append_path(path + "/fonts")
        env.append_path(path + "/images")
        env.append_path(path + "/javascripts")
        env.append_path(path + "/stylesheets")

        if Config.production?
          env.js_compressor  = YUI::JavaScriptCompressor.new
          env.css_compressor = YUI::CssCompressor.new
        end
      end
    end

    get "/assets/:release/purple.js" do
      respond_with_asset(@assets["purple.js"])
    end

    get "/assets/:release/modernizr.min.js" do
      respond_with_asset(@assets["modernizr.min.js"])
    end

    get "/assets/:release/purple.css" do
      respond_with_asset(@assets["purple.css"])
    end

    (%w{ico jpg png} + %w{eot svg ttf woff}).each do |format|
      get "/assets/*.#{format}" do |image|
        name = "#{image}.#{format}"
        if @assets[name]
          respond_with_asset(@assets[name])
        else
          404
        end
      end
    end

    private

    def respond_with_asset(asset)
      cache_control(:public, max_age: 2592000)
      content_type(asset.content_type)
      last_modified(asset.mtime.utc)
      asset
    end
  end
end
