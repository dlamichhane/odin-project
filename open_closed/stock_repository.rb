# frozen_string_literal: true

class StockMarketRepo
  attr_accessor :storage

  def initialize(storage)
    @storage = storage
  end

  def search_stocks(ticker)
    @storage.stocks.select { |stock| stock["symbol"] == ticker }
  end

  def add_stock(stock)
    return false unless stock.is_a?(Hash)

    @storage.stocks << stock

    File.write(@storage.path, { "stocks" => @storage.stocks }.to_json)
  end
end
