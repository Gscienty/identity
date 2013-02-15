require "base64"

module Identity
  class HerokuAPI < Excon::Connection
    def initialize(options={})
      headers = {
        "Accept"          => "application/vnd.heroku+json; version=3",
        "Heroku-Group-ID" => options[:request_id],
      }.merge(options[:headers] || {})
      if options[:user] || options[:pass]
        authorization = ["#{options[:user] || ''}:#{options[:pass] || ''}"].
          pack('m').delete("\r\n")
        headers["Authorization"] = "Basic #{authorization}"
      elsif options[:authorization]
        headers["Authorization"] = options[:authorization]
      end
      super(Config.heroku_api_url, headers: headers,
        instrumentor: ExconInstrumentor.new(id: options[:request_id]))
    end
  end
end
