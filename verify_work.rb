require_relative 'lib/text2image'

begin
  puts "--- text2image 기능 테스트 ---"
  
  # 1. 시스템 폰트 탐지 테스트
  font_path = Text2image.find_font
  puts "탐지된 시스템 폰트 경로: #{font_path}"
  
  # 2. 이미지 생성 테스트 (hello_text.png 생성)
  output_file = "test_output.png"
  puts "이미지 생성 시도 중: #{output_file}..."
  
  Text2image.convert("Hello, Text2Image v1.0!\nThis is a test run.", 
    output: output_file,
    font_size: 40
  )
  
  if File.exist?(output_file)
    puts "성공! 이미지가 생성되었습니다: #{File.expand_path(output_file)}"
  else
    puts "실패: 이미지가 생성되지 않았습니다."
  end

rescue LoadError => e
  puts "오류: 의존성 라이브러리가 없습니다. 'bundle install'을 실행했는지 확인하세요. (#{e.message})"
rescue => e
  puts "오류 발생: #{e.message}"
  puts "참고: ImageMagick이 설치되어 있어야 합니다. (sudo apt install imagemagick)"
end
