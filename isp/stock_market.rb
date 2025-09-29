# frozen_string_literal: true

require_relative "print_results"
require_relative "json_storage"
require_relative "yaml_storage"
require_relative "stock_repository"

module Tradable
  def buy
    raise "Implement Error"
  end

  def sell
    raise "Implement Error"
  end
end

module StockPrice
  def price
    raise "Implement Error"
  end
end

class Trader
  include Tradable
  include StockPrice

  def buy
    "Execute buy trade"
  end

  def sell
    "Execute sell trade"
  end

  def price
    "1.0 Euro"
  end
end

class PriceViewer
  include StockPrice

  def price
    "1.0 Euro"
  end
end

module Location
  def address
    raise "Implement Error"
  end
end

class StockMarket
  attr_accessor :repo

  def initialize(repo)
    @repo = repo
  end

  def search_stocks(ticker)
    repo.search_stocks(ticker)
  end

  def add_stock(stock)
    repo.add_stock(stock)
  end
end

class NYSEStockMarket < StockMarket
  include Location

  def address
    "NYSE"
  end
end

class FrankfurtStockMarket < StockMarket
  include Location

  def address
    "Frankfurt"
  end
end

# storage creation can use Factory Pattern
JSONStorage.new("stocks.json")
storage = YAMLStorage.new("stocks.yml")
stock_market_repo = StockMarketRepo.new(storage)
StockMarket.new(stock_market_repo)
market = FrankfurtStockMarket.new(stock_market_repo)
market.add_stock({ "symbol" => "AMZ", "name" => "Amazon Inc.", "price" => 222.87, "sector" => "Technology" })
print_results = PrintResults.new(market)
print_results.print
