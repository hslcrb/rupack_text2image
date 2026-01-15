# text2image

`text2image`는 텍스트를 하얀 바탕에 검은색 글꼴로 자동화하여 이미지로 변환해주는 루비(Ruby) 라이브러리입니다. 시스템에 설치된 폰트를 자동으로 탐지하고, 텍스트 크기에 맞춰 여백(Padding)이 포함된 최적의 이미지를 생성합니다.

`text2image` is a Ruby library that transforms text into black-on-white images with automatic system font detection and smart padding adjustment.

## 주요 기능 (Features)

- **텍스트-이미지 변환**: 어떤 문자열이든 PNG/JPG 이미지로 변환합니다.
- **자동 폰트 탐지**: `fontconfig`를 사용하여 시스템의 최적 폰트를 자동으로 찾습니다.
- **스마트 여백 (Smart Padding)**: 텍스트의 실제 크기를 계산하여 4방면에 균일한 여백을 자동으로 추가합니다.
- **유연한 설정**: 폰트 크기, 배경색, 글자색, 여백 크기 등을 자유롭게 조절할 수 있습니다.

## 설치 요구사항 (Requirements)

이 라이브러리는 **ImageMagick**과 **fontconfig**가 시스템에 설치되어 있어야 합니다.

### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install imagemagick fontconfig
```

### macOS
```bash
brew install imagemagick fontconfig
```

## 설치 (Installation)

`Gemfile`에 다음 줄을 추가하세요:

```ruby
gem 'text2image'
```

그 후 아래 명령어를 실행합니다:

```bash
$ bundle install
```

## 사용법 (Usage)

### 기본 사용 (Basic Usage)

```ruby
require 'text2image'

# 텍스트를 이미지 파일로 저장 (기본 여백 10px 적용)
Text2image.convert("안녕하세요!", output: "hello.png")

# 옵션 설정 (여백 포함)
Text2image.convert("Ruby", 
  output: "ruby.png",
  font_size: 50,
  padding: 20,
  background: "white",
  foreground: "black"
)
```

## 저작권 및 라이선스 (License)

Copyright (c) 2008-2026 Rheehose (Rhee Creative).
이 라이브러리는 [MIT License](LICENSE) 하에 배포됩니다.
