require './lib/card'

class CardGenerator
  def initialize(filename)
    @filename = filename
  end

  def cards
    IO.readlines(@filename, chomp: true).map do |line|
      card_info = line.split(',')
      question = card_info[0]
      answer = card_info[1]
      category = card_info[2]
      Card.new(question, answer, category)
    end
  end
end
