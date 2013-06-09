output = File.new("output.txt","w+")

File.open("input.txt","r").each do |line| 
  line.gsub!(/^(?!Mr.)/,"Ms. ")
  output.puts line.gsub(/(\w+) (\w+)/, '\2, \1')
end