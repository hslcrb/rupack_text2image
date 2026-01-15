# text2image

`text2image` is a Ruby library that transforms text into black-on-white images. It automatically detects system fonts and generates optimized images with configurable padding around the text.

## Features

- **Text to Image**: Convert any text string into a PNG/JPG image.
- **Auto Font Detection**: Automatically finds the best available system font using `fontconfig`.
- **Smart Padding**: Calculates the bounding box of the text and adds uniform padding on all four sides.
- **Customizable**: Options for font size, background/foreground colors, and padding width.

## Requirements

This library requires **ImageMagick** and **fontconfig** to be installed on your system.

### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install imagemagick fontconfig
```

### macOS
```bash
brew install imagemagick fontconfig
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'text2image'
```

And then execute:

```bash
$ bundle install
```

## Usage

### Basic Usage

```ruby
require 'text2image'

# Save text to an image file (default 10px padding)
Text2image.convert("Hello, World!", output: "hello.png")

# With custom options including padding
Text2image.convert("Ruby is Awesome", 
  output: "ruby.png",
  font_size: 48,
  padding: 30,
  background: "white",
  foreground: "black"
)
```

## License

Copyright (c) 2008-2026 Rheehose (Rhee Creative).
Released under the [MIT License](LICENSE).
