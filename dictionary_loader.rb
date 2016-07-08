class DictionaryLoader

  attr_reader :alphabet_count, :word_count

  def initialize(path)
		@path = path
	end

	def load
		File.open(@path, "r") do |f|
      @word_count = 0
      @alphabet_count = {"A" => 0} #initalizing hash with A so that is not nil during first iteration
		  f.each_line do |line|
		    first_letter = line.split(//)[0].capitalize
        if(first_letter != nil)
          unless(@alphabet_count.has_key?(first_letter))
            @alphabet_count[first_letter] = 1 
          else
            @alphabet_count[first_letter] += 1
          end
          @word_count += 1
        end  
		  end
		end
	end 

end 



