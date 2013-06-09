output = File.new("output.txt","w+")

File.open("input.txt","r").each do |line| 
  output.puts line.gsub(/(Mr. ?)|^/,"Ms. ")
end