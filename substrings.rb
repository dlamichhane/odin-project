# frozen_string_literal: true

# Project substrings

def substrings(text, collection)
  collection.each_with_object(Hash.new(0)) do |word, result|
    count = text.split.reduce(0) do |sum, text_word|
      sum += 1 if text_word.downcase.match?(word)
      sum
    end
    result[word] = count if count.positive?
  end
end
