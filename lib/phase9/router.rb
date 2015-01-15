require 'webrick'
require 'phase6/router'

module Phase9
  class Route
    def initialize(pattern, http_method, controller_class, action_name)
      super
    end
  end

  class Router
    attr_reader :routes

    def initialize
      @routes = []
    end
  end
end
