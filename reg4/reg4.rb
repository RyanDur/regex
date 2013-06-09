output = File.new('output.txt', 'w+')

File.open('input.txt').each_line do |line|
  line.gsub!(/-(\d{2})$/, '-20\1')
  output.puts line
end
