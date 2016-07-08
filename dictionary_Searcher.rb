require_relative './dictionary_loader.rb'

class DictionarySearcher
  attr_reader :results

  def initialize(path)
    @path = path
  end 

  def search(option)
    @results = []
    case option
      when "1"
        puts "Enter an exact term to match with:"
        search_term = gets.chomp
        @regex = /^#{search_term}$/
        match(search_term) 
      when "2" 
        puts "Enter an partial term to match with:"
        search_term = gets.chomp
        @regex = /.*#{search_term}.*/
        match(search_term) 
      when "3" 
        puts "Enter the start of a word to match with:"
        search_term = gets.chomp
        @regex = /^#{search_term}.*/
        match(search_term)
      when "4" 
        puts "Enter the end of a word to match with:"
        search_term = gets.chomp
        @regex = /.*#{search_term}$/
        match(search_term)
    end 
  end 

  def match(search_term)
    File.open(@path, "r") do |f|
      f.each_line do |line|
        if(line.match(@regex))
          @results.push(line)
        end
      end 
    end 
  end

end 

 