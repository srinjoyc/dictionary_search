class ResultsSaver
  
  def self.save(results)
    File.open("results.txt", "w") do |f| 
      results.each do |word|
        f.puts word
      end  
    end
    puts "File saved as results.txt successful." 
  end 

end 