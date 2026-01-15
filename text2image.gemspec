# frozen_string_literal: true

require_relative "lib/text2image/version"

Gem::Specification.new do |spec|
  spec.name          = "text2image"
  spec.version       = Text2image::VERSION
  spec.authors       = ["Rheehose (Rhee Creative)"]
  spec.email         = ["rheehose@rheehose.com"]

  spec.summary       = "A Ruby library to convert text to images with automatic system font detection."
  spec.description   = "text2image allows you to easily transform text into black-and-white images using the best available system fonts. Ideal for quick image generation from text data."
  spec.homepage      = "https://github.com/hslcrb/rupack_text2image"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "mini_magick", "~> 4.12"
end
