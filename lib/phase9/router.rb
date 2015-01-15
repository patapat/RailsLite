require 'webrick'
require 'phase6/router'

module Phase9
  class Route < Phase6::Route
    def initialize(pattern, http_method, controller_class, action_name)
      super
    end
  end

  class Router < Phase6::Router
    attr_reader :routes

    def initialize
      @routes = []
    end

    
  end
end
