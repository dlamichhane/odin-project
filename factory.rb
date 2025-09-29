# frozen_string_literal: true

class Product
  def initialize(name: "RAT")
    @name = name
  end
end

class ProductA < Product
  def info
    puts "I am #{@name}"
  end
end

class ProductB < Product
  def info
    puts "I am #{@name}"
  end
end

class ProductFactory
  @registry = {}

  class << self
    def register(key, klass)
      @registry[key] = klass
    end

    def build(key, **args)
      klass = @registry[key]
      raise "No klass available" unless klass

      klass.new(name: args[:name])
    end
  end
end

ProductB.new.info
ProductFactory.register(:product_a, ProductA)
ProductFactory.register(:product_b, ProductB)
args = { name: "Ball", size: 12 }
ProductFactory.build(:product_a, **args).info
ProductFactory.build(:product_b, name: "Doll", size: 12).info
