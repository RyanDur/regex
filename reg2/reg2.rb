output = File.new("output.txt", "w+")

File.open("input.txt").each_line do |line|
  line.gsub!(/^\s*\d*\s*|\[\d+\]/,'')
  output.puts line unless line.empty?
end
