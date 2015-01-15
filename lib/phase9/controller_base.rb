require_relative '../phase8/controller_base'
require_relative './url_helpers'
require_relative './router'

require 'byebug'

module Phase9
  class ControllerBase < Phase8::ControllerBase
    def link_to(title, path)
      "<a href='#{path}'>#{title}</a>"
    end

    def button_to(title, path, methods = {})
      final_str = "<form action='#{path}' method='post'><input type='submit' value='#{title}'></form>"

      methods.each do |sym, method|
        if method == :patch
          final_str = "<form action='#{path}' method='post'><input type='hidden' name='_method' value='patch'><input type='submit' value='#{title}'></form>"
        elsif method == :destroy
          final_str = "<form action='#{path}' method='delete'><input type='submit' value='#{title}'></form>"
        end
      end

      final_str
    end
  end
end
