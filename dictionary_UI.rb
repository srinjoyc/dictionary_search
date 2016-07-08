require_relative "./dictionary_loader.rb"
require_relative "./dictionary_Searcher.rb"
require_relative "./results_saver.rb"

class DictionaryUI

  attr_reader :path

  def stats 
    hash = @dicitonary.alphabet_count
    count = @dicitonary.word_count
    puts 'Word frequencies of the first letter'   
    hash.each do |key,value|
      puts "#{key}: #{value}"
    end
    puts "Total Word Count: #{count}" 
	end

  def load(path)
    if(File.exist?(path))
      @path = path 
      @dicitonary = DictionaryLoader.new(@path)
      @dicitonary.load
    else 
      puts "invalid path: aborting"
      throw :nosuchfile
    end
    puts 'Dictionary Loaded' 
  end

  def searchSelect
    puts "
            Select one of the search options by entering the corresponding number:
            1: Exact Match
            2: Partial Match
            3: Begins with
            4: Ends with
         "
    option = gets.chomp
    until((1..4).include?(option.to_i))
      puts "invalid option, try again"
      option = gets.chomp
    end
    return option 
  end

  def displayResults(results)
      puts results
      puts "Found #{results.length} matches"
      puts "--------------END OF RESULTS---------------\n"
      puts "Save results? Press 1 to save"
      if(gets.chomp.to_i == 1)
        ResultsSaver.save(results)
      end  
  end 

end 
  