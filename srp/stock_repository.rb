# frozen_string_literal: true

require "yaml"

class StockMarketRepo
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
end
