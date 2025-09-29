# frozen_string_literal: true

require "json"

class JSONStorage
  attr_accessor :stocks, :path

  def initialize(path)
    @path = path
    @stocks = JSON.parse(File.read(@path))["stocks"]
  end
end
