require_relative '../phase6/controller_base'
require_relative './flash'
require 'byebug'

module Phase8
  class ControllerBase < Phase6::ControllerBase
    def redirect_to(url)
      super
      flash
    end

    def render_content(content, type)
      super

    end

    # method exposing a `Session` object
    def flash
      @flash ||= Flash.new(@req)
    end
  end
end
