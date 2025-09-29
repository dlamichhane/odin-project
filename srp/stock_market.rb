# frozen_string_literal: true

require_relative "print_results"
require_relative "stock_repository"

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

stock_market_repo = StockMarketRepo.new
market = StockMarket.new(stock_market_repo)
market.add_stock({ "symbol" => "AMZ", "name" => "Amazon Inc.", "price" => 222.87, "sector" => "Technology" })
print_results = PrintResults.new(market)
print_results.print
