require_relative 'lib/text2image'

begin
  puts "--- text2image v1.1.0 최종 통합 테스트 ---"
  
  # 1. 시스템 폰트 탐지 테스트
  font_path = Text2image.find_font
  puts "탐지된 시스템 폰트 경로: #{font_path}"
  
  # 2. 이미지 생성 테스트 (스마트 여백 기능 확인)
  output_file = "test_padded_result.png"
  padding_value = 50
  
  puts "이미지 생성 중 (여백: #{padding_value}px)..."
  Text2image.convert("Ruby Text2Image\nSmart Padding Test", 
    output: output_file,
    font_size: 40,
    padding: padding_value,
    background: "white",
    foreground: "black"
  )
  
  if File.exist?(output_file)
    puts "✅ 성공! 이미지가 생성되었습니다: #{File.expand_path(output_file)}"
    
    # 3. 실제 이미지 크기 확인 (여백이 잘 들어갔는지 간접 확인)
    image = MiniMagick::Image.open(output_file)
    puts "생성된 이미지 크기: #{image.width}x#{image.height}"
    puts "테스트 완료!"
  else
    puts "❌ 실패: 이미지가 생성되지 않았습니다."
  end

rescue => e
  puts "❌ 오류 발생: #{e.message}"
end
