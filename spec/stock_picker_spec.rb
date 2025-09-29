# frozen_string_literal: true

require "rspec"
require_relative "../stock_picker"

RSpec.describe("#stock_picker") do
  it "returns high profit day to buy and sell" do
    expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to(eq([1, 4]))
  end
end
