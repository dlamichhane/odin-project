# frozen_string_literal: true

# Project stock picker
# [17, 3, 6, 9, 15, 8, 6, 1, 10]
# [3, 6, 9, 15, 8, 6, 1, 10]
# [6, 9, 15, 8, 6, 1, 10]
# [9, 15, 8, 6, 1, 10]
# [15, 8, 6, 1, 10]
# [8, 6, 1, 10]
# [6, 1, 10]
# [1, 10]
# [10]
# []

def stock_picker(collection)
  max_profit = 0
  indexes = [0, 0]
  collection.each_with_index do |price, idx|
    collection[(idx + 1).to_s.to_i..].each do |second_price|
      profit = second_price - price
      next if profit.negative?

      if profit > max_profit
        max_profit = profit
        indexes = [idx, collection.index(second_price)]
      end
    end
  end
  indexes
end
