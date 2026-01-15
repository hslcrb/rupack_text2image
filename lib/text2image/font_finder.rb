# frozen_string_literal: true

require 'open3'

module Text2image
  class FontFinder
    class << self
      def find_font(name = nil)
        return name if name && File.exist?(name)

        search_query = name || "sans-serif"
        
        cmd = "fc-list \"#{search_query}\" :file"
        stdout, stderr, status = Open3.capture3(cmd)
        
        if status.success? && !stdout.empty?
          path = stdout.split("\n").first.split(":").first.strip
          return path if File.exist?(path)
        end

        fallback_fonts = [
          "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
          "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
          "/usr/share/fonts/TTF/DejaVuSans.ttf",
          "Arial"
        ]

        fallback_fonts.each do |f|
          return f if File.exist?(f) || f == "Arial"
        end

        nil
      end
    end
  end
end
