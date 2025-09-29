# frozen_string_literal: true

class PrintResults
  attr_accessor :market

  def initialize(market)
    @market = market
  end

  def print
    market.repo.storage.stocks.each do |stock|
      puts "SYMBOL: #{stock["symbol"]}, PRICE: #{stock["price"]}"
    end
  end
end
