# frozen_string_literal: true

require "rspec"
require_relative "../substrings"

RSpec.describe("#substrings") do
  collection = [
    "below",
    "down",
    "go",
    "going",
    "horn",
    "how",
    "howdy",
    "it",
    "i",
    "low",
    "own",
    "part",
    "partner",
    "sit",
  ]
  text = "Howdy partner, sit down! How's it going?"
  let(:result) do
    {
      "down" => 1,
      "go" => 1,
      "going" => 1,
      "how" => 2,
      "howdy" => 1,
      "it" => 2,
      "i" => 3,
      "own" => 1,
      "part" => 1,
      "partner" => 1,
      "sit" => 1,
    }
  end
  it "returns substrings" do
    expect(substrings(
      text,
      collection,
    )).to(eql(result))
  end
end
