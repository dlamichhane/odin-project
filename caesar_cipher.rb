# frozen_string_literal: true

# Project: Caesar Cipher

def caesar_cipher(text, encrypt_code)
  text.each_char.map do |char|
    chiper_byte = char.ord + encrypt_code
    if (65..90).include?(char.ord)
      differences = (90 - chiper_byte)
      differences.negative? ? (64 + differences.abs).chr : chiper_byte.chr
    elsif (97..122).include?(char.ord)
      differences = (122 - chiper_byte)
      differences.negative? ? (96 + differences.abs).chr : chiper_byte.chr
    else
      char
    end
  end.join
end

# caesar_cipher("What a string!", 5)
