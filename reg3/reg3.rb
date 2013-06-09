output = File.new('output.txt', 'w+')

File.open('input.txt').each_line do |line|
  line.gsub!(/the(irs?|y're|re)/, 'his')
  output.puts line
end
