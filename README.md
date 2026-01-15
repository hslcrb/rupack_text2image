# text2image

`text2image`는 텍스트를 하얀 바탕에 검은색 글꼴로 자동화하여 이미지로 변환해주는 루비(Ruby) 라이브러리입니다. 시스템에 설치된 폰트를 자동으로 탐지하여 최적의 렌더링을 제공합니다.

`text2image` is a Ruby library that transforms text into black-on-white images. It automatically detects system fonts to provide the best rendering results.

## Features

- **Text to Image**: Convert any text string into a PNG/JPG image.
- **Auto Font Detection**: Automatically finds the best available system font using `fontconfig`.
- **Easy Integration**: Simple API to generate images or get image blobs.
- **Customizable**: Options for font size, colors, and specific font paths.

## Requirements

이 라이브러리는 **ImageMagick**과 **fontconfig**가 시스템에 설치되어 있어야 합니다.
This library requires **ImageMagick** and **fontconfig** to be installed on your system.

### Linux (Ubuntu/Debian)
```bash
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

Or install it yourself as:

```bash
$ gem install text2image
```

## Usage

### Basic Usage

```ruby
require 'text2image'

# Save text to an image file
Text2image.convert("Hello, World!", output: "hello.png")

# With options
Text2image.convert("Ruby is awesome!", 
  output: "ruby.png",
  font_size: 48,
  background: "white",
  foreground: "black"
)
```

### Advanced Usage

```ruby
# Get a MiniMagick object
image = Text2image.convert("Instant image")
puts image.width
puts image.height

# Find where a font is located
font_path = Text2image.find_font("sans-serif")
puts "Using font: #{font_path}"
```

## Contributing

버그 제보와 풀 리퀘스트는 GitHub에서 환영합니다: [https://github.com/rheehose/text2image](https://github.com/rheehose/text2image)

Bug reports and pull requests are welcome on GitHub at [https://github.com/rheehose/text2image](https://github.com/rheehose/text2image).

## License

Copyright (c) 2008-2026 Rheehose (Rhee Creative).
The gem is available as open source under the terms of the [MIT License](LICENSE).
