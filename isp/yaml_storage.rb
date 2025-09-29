# frozen_string_literal: true

require "yaml"

class YAMLStorage
  attr_accessor :stocks, :path

  def initialize(path)
    @path = path
    @stocks = YAML.safe_load_file(@path)["stocks"]
  end
end
