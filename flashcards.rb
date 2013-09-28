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
   
  # @deck = Deck.new( filename )
  # @deck.cards

end

class Card
  attr_reader :word, :definition

  def initialize(word_definition_hash)
    @word = word_definition_hash[:word]
    @definition = word_definition_hash[:definition]
  end

end

class FileHandler
  # GIVES US A ARRAY OF HASHES, EACH HASH HAS 2 KEYS/VALUES
end

class GameController
  
  def self.run(name_of_file_txt)
  word_definition_hasharray = FileHandler.parse_to_card_hash(name_of_file_txt)
  my_deck = Deck.new
  word_definition_hash.each 

  # my_deck Card.new(word_definition_hash)
  end

end

name_of_file_txt = ARGV[0]
Controller.run(name_of_file_txt)


