require 'pry'
require './lib/card_generator'
require './lib/card'

describe CardGenerator do
  before(:each) do
    filename = "cards.txt"
    @gen = CardGenerator.new(filename)
  end

  it 'exists' do
    expect(@gen).to be_an_instance_of(CardGenerator)
  end

  it "#cards" do
    expect(@gen.cards).to be_an(Array)
    expect(@gen.cards.first).to be_an_instance_of(Card)
  end
end
