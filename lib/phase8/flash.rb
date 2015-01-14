require 'json'
require 'webrick'

module Phase8
  class Flash
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @cookie = req.cookies.find { |cookie| cookie.name == "_rails_lite_app" }
      @flash = (@cookie.nil? ? {} : JSON.parse(@cookie.value))
    end

    def [](key)
      @flash[key]
    end

    def []=(key, val)
      @flash[key] = val
    end

    def now

    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_flash(res)
      res.cookies << WEBrick::Cookie.new("_rails_lite_app", @flash.to_json)
    end
  end
end
