# frozen_string_literal: true

require_relative "text2image/version"
require_relative "text2image/font_finder"
require_relative "text2image/converter"

module Text2image
  class Error < StandardError; end

  class << self
    def convert(text, options = {})
      converter = Converter.new(text, options)
      
      if options[:output]
        converter.render(options[:output])
      else
        converter.render
      end
    end

    def find_font(name = nil)
      FontFinder.find_font(name)
    end
  end
end
