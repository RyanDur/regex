output = File.new('output.txt', 'w+')

File.open('input.txt').each_line do |line|
  line.gsub!(/^(\d{1})-/, '0\1-')
  line.gsub!(/-(\d{1})-/, '-0\1-')
  line.gsub!(/-(\d{2})$/, '-20\1')
  line.gsub!(/(\d{2})-(\d{2})-(\d{4})/, '\3-\1-\2')
  output.puts line
end
