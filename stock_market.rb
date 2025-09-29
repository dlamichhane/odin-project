# frozen_string_literal: true

# Original code

require "yaml"

class StockMarket
  PATH = "stocks.yml"
  attr_accessor :stocks

  def initialize
    @stocks = YAML.safe_load_file(PATH)["stocks"]
  end

  def search_stocks(ticker)
    @stocks.select { |stock| stock["symbol"] == ticker }
  end

  def add_stock(stock)
    return false unless stock.is_a?(Hash)

    @stocks << stock

    File.write(PATH, { "stocks" => @stocks }.to_yaml)
  end

  def print_results
    stocks.each do |stock|
      puts "SYMBOL: #{stock["symbol"]}, PRICE: #{stock["price"]}"
    end
  end
end

# market = StockMarket.new
# stocks = market.search_stocks({})
# market.print_results(stocks)

# {"symbol" => "AMZ", "name" => "Amazon Inc.", "price" => 222.87, "sector" => "Technology"}
