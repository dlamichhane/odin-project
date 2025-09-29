# frozen_string_literal: true

require_relative "../stock_market"

RSpec.describe(StockMarket) do
  subject(:stock_market) { StockMarket.new }

  let(:yaml_content) do
    {
      "stocks" => [
        {
          "symbol" => "AAPL", "name" => "Apple Inc.", "price" => 200, "sector" => "Technology",
        },
        {
          "symbol" => "TSLA", "name" => "Tesla Inc.", "price" => 256.13, "sector" => "Automotive",
        },
        {
          "symbol" => "MSFT", "name" => "Microsoft Corp.", "price" => 412.15, "sector" => "Technology",
        },
        {
          "symbol" => "AMZ", "name" => "Amazon Inc.", "price" => 222.87, "sector" => "Technology",
        },
      ],
    }
  end

  before do
    fake_file = StringIO.new(yaml_content.to_yaml)

    allow(File).to(receive(:read).and_return(fake_file.string))

    allow(File).to(receive(:write).and_return(Random.rand(5)))
  end

  let(:apple_stock) do
    [{
      "symbol" => "AAPL", "name" => "Apple Inc.", "price" => 200, "sector" => "Technology",
    }]
  end

  let(:new_stock) do
    [{
      "symbol" => "AAPL_#{Random.hex(2)}", "name" => "Apple Inc.", "price" => 198.87, "sector" => "Technology",
    }]
  end

  it "#search_stocks", :slow do
    expect(stock_market.search_stocks("AAPL")).to(eql(apple_stock))
  end

  it "#add_stock" do
    expect(stock_market.add_stock(new_stock.first)).to(be_kind_of(Integer))
  end

  it "#print_results" do
    expect { stock_market.print_results }.to(output.to_stdout)
  end
end
