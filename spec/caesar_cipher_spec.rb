# frozen_string_literal: true

require_relative "../caesar_cipher"

RSpec.describe("#caesar_cipher") do
  it "shifts characters by the given amount" do
    expect(caesar_cipher("What a string!", 5)).to(eq("Bmfy f xywnsl!"))
  end
end
