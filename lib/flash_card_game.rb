require 'pry'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

class FlashCardGame
  def initialize(file)
    @cards = CardGenerator.new(file).cards
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def start
    welcome
    rounds
    end_game
  end

  def welcome
    puts "Welcome! You're playing with #{@cards.length} cards."
    puts "-----------------------"
  end

  def rounds
    until @round.deck.count < @round.count do
      puts "This is card number #{@round.count} out of #{@cards.length}."
      puts "Question: #{@round.current_card.question}"
      guess = gets.chomp
      turn = @round.take_turn(guess)
      puts turn.feedback
    end
  end

  def end_game
    puts "****** Game over! ******"
    puts "You had #{@round.number_correct} correct guesses out of #{@cards.length} for a total score of #{@round.percent_correct}%."
    @round.deck.categories.each do |category|
      puts "#{category} - #{@round.percent_correct_by_category(category)}% correct"
    end
  end
end
