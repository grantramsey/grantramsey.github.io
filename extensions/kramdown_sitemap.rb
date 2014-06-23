# -*- encoding : utf-8 -*-
require 'kramdown'

module Kramdown
  module Parser
    class Kramdown
      
      alias_method :old_add_link, :add_link
      def add_link(el, href, title, alt_text = nil)
        if $middleman_application && $middleman_application.respond_to?(:url_for)
          href = $middleman_application.url_for(href)
        end
        
        old_add_link el, href, title, alt_text
      end
      
    end
  end
  
  module Converter
    class Html
      
      alias_method :old_convert_img, :convert_img
      def convert_img(el, indent)
        if $middleman_application && $middleman_application.respond_to?(:image_tag)
          $middleman_application.image_tag(el.attr['src'], :title => el.attr['title'], :alt => el.attr['alt'])
        else
          old_convert_img el, indent
        end
      end
      
    end
  end
end
