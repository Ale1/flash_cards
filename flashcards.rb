# Main file for 
class Deck

  def initialize(file_name)
    @cards = FileHandler.parse_to_card_array(file_name).map do |hash|
      Card.new(hash)
    end
  end

  # def grab_card_stack


  # end
  def shuffle
    @cards.sort_by {rand}
  end

  def draw
    @cards.shift
  end

  def to_s
    deck_string = ""
    @cards.each { |card| deck_string << "#{card}\n"}
    deck_string
  end
   
  # @deck = Deck.new( filename )
  # @deck.cards

end

class Card
  attr_reader :word, :definition

  def initialize(word_definition_hash)
    @word = word_definition_hash[:word]
    @definition = word_definition_hash[:definition]
  end

  def to_s
    "#{@word}: #{@definition}"
  end

end

class FileHandler 
  def self.parse_to_card_array(file)
    # Takes filename as input
    # Returns Array of Hash objects
    # { :definition => word definition ,
    #   :term => word name }
    card_array = []
    file_array = File.readlines(file)
    file_array.map! { |line| line.chomp }
    file_array.each_slice(3) do |single_card|
      card_array << Hash[:definition, single_card[0], :word, single_card[1]] 
    end
   card_array
  end
end

# puts FileHandler.parse_to_card_array('flashcard_samples.txt')


class GameController
  
  def self.run(name_of_file_txt)
    my_deck = Deck.new(name_of_file_txt)
    puts my_deck

  # my_deck Card.new(word_definition_hash)
  end

end

name_of_file_txt = ARGV[0]
GameController.run(name_of_file_txt)


