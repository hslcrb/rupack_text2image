# frozen_string_literal: true

require 'mini_magick'

module Text2image
  class Converter
    attr_accessor :text, :font, :font_size, :background, :foreground

    def initialize(text, options = {})
      @text = text
      @font = options[:font] || FontFinder.find_font
      @font_size = options[:font_size] || 24
      @background = options[:background] || "white"
      @foreground = options[:foreground] || "black"
    end

    def render(output_path = nil)
      image = MiniMagick::Image.create("png", false) do |c|
        c.background @background
        c.fill @foreground
        c.font @font if @font
        c.pointsize @font_size
        c.label @text
      end

      if output_path
        image.write(output_path)
        output_path
      else
        image
      end
    rescue StandardError => e
      raise "Failed to render image: #{e.message}. Ensure ImageMagick is installed."
    end

    def to_blob(format = "png")
      render.format(format).to_blob
    end
  end
end
