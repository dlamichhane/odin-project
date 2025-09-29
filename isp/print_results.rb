# frozen_string_literal: true

class PrintResults
  attr_accessor :market

  def initialize(market)
    @market = market
  end

  def print
    puts "LOCATION :: #{market.respond_to?(:address) ? market.address : "Not Available"}"
    market.repo.storage.stocks.each do |stock|
      puts "SYMBOL: #{stock["symbol"]}, PRICE: #{stock["price"]}"
    end
  end
end
