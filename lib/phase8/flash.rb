require 'json'
require 'webrick'

module Phase8
  class Flash
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @cookie = req.cookies.find { |cookie| cookie.name == "_rails_lite_app_flash" }
      @flash_later = {}
      @flash_now = (@cookie.nil? ? {} : JSON.parse(@cookie.value))
    end

    def [](key)
      if @flash_now.empty?
        @flash_later[key.to_s]
      else
        @flash_now[key]
      end
    end

    def []=(key, val)
      @flash_later[key] = val
    end

    def now
      @flash_now
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_flash(res)
      res.cookies << WEBrick::Cookie.new("_rails_lite_app_flash", @flash_later.to_json)
    end
  end
end
