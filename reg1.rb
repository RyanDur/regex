strings = ["Mr. Ned Beatty",
"Diana Christensen",
"Mr. Max Schumacher",
"Mr. Robert Duvall",
"Mr. Frank Hackett",
"Beatrice Straight",
"Faye Dunaway",
"Mr. Howard Beale",
"Louise Schumacher           ",
"Mr. William Holden",
"Mr. Arthur Jensen",
"Carolyn Krigbaum",
"Cindy Grover",
"Mr. Peter Finch"]

strings.each{|e| puts e.gsub(/(Mr. ?)|^/, "Ms. ")}

strings.each{|e| puts e.gsub(/ (\w+)(\w+)/, "")}