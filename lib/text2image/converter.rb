# frozen_string_literal: true

require 'mini_magick'

module Text2image
  class Converter
    attr_accessor :text, :font, :font_size, :background, :foreground, :padding

    def initialize(text, options = {})
      @text = text
      @font = options[:font] || FontFinder.find_font
      @font_size = options[:font_size] || 24
      @background = options[:background] || "white"
      @foreground = options[:foreground] || "black"
      @padding = options[:padding] || 10
    end

    def render(output_path = nil)
      require 'tempfile'
      
      # Step 1: Get text dimensions without padding
      # We use 'pango' or 'caption' if available for better text handling
      # But for simplicity and portability, we use 'label' or 'caption' with trim
      
      temp_raw = Tempfile.new(['text2image_raw', '.png'])
      raw_path = temp_raw.path
      temp_raw.close

      # Render text on a large enough canvas then trim to find bounding box
      MiniMagick::Tool::Convert.new do |c|
        c.background @background
        c.fill @foreground
        c.font @font if @font
        c.pointsize @font_size
        c << "label:#{@text}"
        c.trim
        c << raw_path
      end

      # Step 2: Get dimensions of the trimmed text
      trimmed_image = MiniMagick::Image.open(raw_path)
      width = trimmed_image.width
      height = trimmed_image.height

      # Step 3: Create final image with padding
      final_width = width + (@padding * 2)
      final_height = height + (@padding * 2)

      temp_final = Tempfile.new(['text2image_final', '.png'])
      final_path = temp_final.path
      temp_final.close

      MiniMagick::Tool::Convert.new do |c|
        c.size "#{final_width}x#{final_height}"
        c.canvas @background
        c.fill @foreground
        c.font @font if @font
        c.pointsize @font_size
        c.gravity "Center"
        c.draw "text 0,0 '#{@text.gsub("'", "\\\\'")}'"
        c << final_path
      end

      image = MiniMagick::Image.open(final_path)

      if output_path
        image.write(output_path)
        output_path
      else
        image
      end
    rescue StandardError => e
      raise "Failed to render image: #{e.message}. Ensure ImageMagick is installed and accessible."
    end

    def to_blob(format = "png")
      render.format(format).to_blob
    end
  end
end
