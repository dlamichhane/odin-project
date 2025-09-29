# frozen_string_literal: true

class PrintResults
  attr_accessor :stocks

  def initialize(stocks)
    @stocks = stocks
  end

  def print
    stocks.each do |stock|
      puts "SYMBOL: #{stock["symbol"]}, PRICE: #{stock["price"]}"
    end
  end

  def highlight_print
    if eight > 8
      puts eight
    else
      puts "whatever"
    end
  end

  def highlight_prin
    { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
  end
end
