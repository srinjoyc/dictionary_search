require_relative "./dictionary_UI.rb"
require_relative "./dictionary_Searcher.rb"
require_relative "./results_saver.rb"

class Dictionary

  def self.main
    ui = DictionaryUI.new  
    puts "enter a path/file name (5desk.txt)"
    path = gets.chomp
    catch :nosuchfile do
      ui.load(path) 
      ui.stats
      finder = DictionarySearcher.new(ui.path)
      while(true)
        finder.search(ui.searchSelect)
        @results = finder.results
        ui.displayResults(@results)
        puts "Search again? 1 to continue, any key to exit"
        break if(gets.chomp.to_i != 1)
      end 
    end
  end 

end

Dictionary.main
 
