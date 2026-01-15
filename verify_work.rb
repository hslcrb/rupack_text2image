require_relative 'lib/text2image'

begin
  puts "--- text2image v1.1.0 최종 통합 테스트 ---"
  
  # 1. 시스템 폰트 탐지 테스트
  font_path = Text2image.find_font
  puts "탐지된 시스템 폰트 경로: #{font_path}"
  
  # 2. 이미지 생성 테스트 (다양한 포맷 및 옵션 확인)
  formats = ["png", "jpg", "webp"]
  
  formats.each do |fmt|
    output_file = "test_result.#{fmt}"
    puts "이미지 생성 중 (#{fmt} 포맷)..."
    Text2image.convert("Ruby Text2Image v1.3\nFormat: #{fmt.upcase}", 
      output: output_file,
      font_size: 35,
      padding: 20,
      background: (fmt == "webp" ? "#E0F7FA" : "white"),
      foreground: (fmt == "webp" ? "#006064" : "black")
    )
    
    if File.exist?(output_file)
      image = MiniMagick::Image.open(output_file)
      puts "✅ 성공! #{fmt.upcase} 생성됨: #{image.width}x#{image.height}"
    else
      puts "❌ 실패: #{fmt.upcase} 생성 실패"
    end
  end
  
  puts "모든 포맷 테스트 완료!"

rescue => e
  puts "❌ 오류 발생: #{e.message}"
end
